import fs from "fs";
import path from "path";
import chalk from "chalk";
import puppeteer from "puppeteer";

import { generateRenderTemplate } from "./utils/htmlTemplate";
import { matchImages } from "./utils/matchImages";
import { saveFrames } from "./utils/saveFrames";
import { getKeyName } from "./utils/getKeyName";
import { spinner } from "./utils/spinner";
import { Config, Frames } from "./types";

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
    spinner.text = `Generating ${chalk.magentaBright(schema)} bitmaps ...`;
    spinner.start();

    // Render
    try {
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

        console.log("Rendering", path.basename(svgPath), "...");
        console.log(firstKey);

        // 1st Frame
        frames[firstKey] = {
          buffer: await svgElement.screenshot({
            omitBackground: true,
            encoding: "binary"
          })
        };

        //  Pushing frames until it match to 1st frame
        index++;
        while (!breakRendering) {
          const newFrame = await svgElement.screenshot({
            omitBackground: true,
            encoding: "binary"
          });
          const key = getKeyName(index, svgPath);
          console.log(key);
          const diff = matchImages({
            img1Buff: frames[firstKey].buffer,
            img2Buff: newFrame
          });

          if (!(diff < 700)) {
            frames[key] = { buffer: newFrame };
          } else {
            breakRendering = true;
          }
          index++;
        }

        saveFrames({ frames, bitmapsDir });

        await page.close();
      }
      spinner.succeed();
    } catch (error) {
      console.error(error);
      spinner.fail();
      process.exit(1);
    }
  }
  console.log(`🎉 Bitmaps stored at ${chalk.greenBright(outDir)}`);
};

export { renderCursors };
