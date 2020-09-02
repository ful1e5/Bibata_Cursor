import fs from "fs";
import path from "path";
import ora from "ora";
import chalk from "chalk";
import puppeteer from "puppeteer";

import { generateRenderTemplate } from "./utils/htmlTemplate";
import { matchImages } from "./utils/matchImages";
import { saveFrames } from "./utils/saveFrames";
import { getKeyName } from "./utils/getKeyName";
import { Config, Frames, PixelDiffRate } from "./types";

const pixelDiffRate: PixelDiffRate = {
  "left_ptr_watch.svg": {
    rate: 100
  },
  "wait.svg": {
    rate: 990
  }
};

const renderCursors = async (configs: Record<string, Config>) => {
  const browser = await puppeteer.launch({
    ignoreDefaultArgs: [" --single-process ", "--no-sandbox"],
    headless: true
  });

  let outDir = "";
  for (let [
    schema,
    { bitmapsDir, staticCursors, animatedCursors }
  ] of Object.entries(configs)) {
    // Checking Bitmaps Dir
    if (!fs.existsSync(bitmapsDir)) {
      fs.mkdirSync(bitmapsDir);
    }

    // Spinner
    const spinner = ora();
    spinner.text = ` Preparing ${schema} Schema...`;
    spinner.start();

    // Render
    try {
      spinner.color = "yellow";
      for (let svgPath of staticCursors) {
        const buffer = fs.readFileSync(svgPath, "utf8");
        if (!buffer) throw new Error(`${svgPath} File Read error`);

        // Generating HTML Template
        const data = buffer.toString();
        const template = generateRenderTemplate(data);

        // config
        const bitmapName = `${path.basename(svgPath, ".svg")}.png`;
        const out = path.resolve(bitmapsDir, bitmapName);

        // Render
        const page = await browser.newPage();
        await page.setContent(template);

        await page.waitForSelector("#container");
        const svgElement = await page.$("#container svg");
        if (!svgElement) throw new Error("svg element not found");
        await svgElement.screenshot({ omitBackground: true, path: out });
        spinner.text = `${chalk.greenBright(bitmapName)}`;

        await page.close();
      }

      for (let svgPath of animatedCursors) {
        const buffer = fs.readFileSync(svgPath, "utf8");
        if (!buffer) throw new Error(`${svgPath} File Read error`);

        // Generating HTML Template
        const data = buffer.toString();
        const template = generateRenderTemplate(data);

        const page = await browser.newPage();
        await page.setContent(template, { waitUntil: "networkidle2" });

        await page.waitForSelector("#container");
        const svgElement = await page.$("#container svg");
        if (!svgElement) throw new Error("svg element not found");

        // Render Config
        let index = 1;
        let breakRendering = false;
        const frames: Frames = {};
        const firstKey = getKeyName(index, svgPath);

        // 1st Frame
        frames[firstKey] = {
          buffer: await svgElement.screenshot({
            omitBackground: true,
            encoding: "binary"
          })
        };
        spinner.text = ` ${chalk.greenBright(firstKey)}`;

        //  Pushing frames until it match to 1st frame
        index++;
        while (!breakRendering) {
          const newFrame = await svgElement.screenshot({
            omitBackground: true,
            encoding: "binary"
          });
          const key = getKeyName(index, svgPath);

          const diff = matchImages({
            img1Buff: frames[firstKey].buffer,
            img2Buff: newFrame
          });

          const { rate } = pixelDiffRate[path.basename(svgPath)];
          if (!(diff < rate)) {
            frames[key] = { buffer: newFrame };
            spinner.text = ` ${chalk.greenBright(key)}`;
          } else {
            breakRendering = true;
          }
          index++;
        }

        saveFrames({ frames, bitmapsDir });

        await page.close();
      }
      spinner.text = `${schema} Bitmaps`;
      spinner.succeed();
    } catch (error) {
      console.error(error);
      spinner.fail();
      process.exit(1);
    }
  }
  console.log(` 🎉 Bitmaps stored at ${chalk.greenBright(outDir)}`);
};

export { renderCursors };
