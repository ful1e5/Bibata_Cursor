import fs from "fs";
import path from "path";
import chalk from "chalk";
import ora, { Ora } from "ora";
import puppeteer, { Browser, ElementHandle } from "puppeteer";
import ColoredSvgGenerator, {
  Cursors,
  Inputs
} from "./SvgHandler/ColoredSvgGenerator";
import { Frames, PixelDiffRate } from "./types";
import { getFrameName } from "./utils/getFrameName";
import { generateRenderTemplate } from "./utils/htmlTemplate";
import { matchImages } from "./utils/matchImages";

const pixelDiffRate: PixelDiffRate = {
  left_ptr_watch: {
    rate: 100
  },
  wait: {
    rate: 990
  }
};

export class BitmapsGenerator {
  private static: Cursors;
  private animated: Cursors;
  private spinner: Ora;

  /**
   *
   * Create directory if it doesn't exists.
   *
   * @param dirPath directory `absolute` or `relative` path.
   */
  private createDir(dirPath: string) {
    dirPath = path.resolve(dirPath);

    if (!fs.existsSync(dirPath)) {
      fs.mkdirSync(dirPath);
    }
  }

  /**
   *
   * @param inputs `BitmapsGenerator` Class's object arguments.
   *
   * @param themeName name of the bitmaps directory.
   *
   * @param bitmapsDir `absolute` or `relative` path, Where cursors `.png` files generated.
   */
  constructor(
    private inputs: Inputs,
    private themeName: string,
    private bitmapsDir: string
  ) {
    this.createDir(this.bitmapsDir);

    this.spinner = ora();
    this.spinner.text = ` Preparing ${this.themeName} Color Schema...`;
    this.spinner.start();

    const svgs = new ColoredSvgGenerator(this.inputs);
    this.static = svgs.getColoredAnimatedCursors();
    this.animated = svgs.getColoredAnimatedCursors();
  }

  /**
   *
   * @param browser `puppeteer` browser instance.
   *
   * @param content `.svg` file code.
   */
  private async getSvgElement(
    browser: Browser,
    content: string
  ): Promise<ElementHandle<Element>> {
    const template = generateRenderTemplate(content);
    const page = await browser.newPage();
    await page.setContent(template);

    await page.waitForSelector("#container");
    const svgElement = await page.$("#container svg");

    if (!svgElement) throw new Error("svg element not found");

    return svgElement;
  }

  /**
   *
   * Close all pages of `Puppeteer`.
   *
   * @param browser `puppeteer` browser instance.
   */
  private async closeAllPages(browser: Browser) {
    const pages = await browser.pages();
    pages.map((page) => page.close());
  }

  /**
   *
   * Generate `static` cursors bitmaps.
   *
   * @param browser `puppeteer` browser instance.
   */
  private async generateStaticCursors(browser: Browser) {
    for (let [cursor] of Object.entries(this.static)) {
      // Generating HTML Template
      const { content } = this.static[`${cursor}`];

      // Configs
      const file = `${cursor}.png`;
      const out = path.resolve(this.bitmapsDir, file);
      const svgElement = await this.getSvgElement(browser, content);

      // Render
      this.spinner.text = ` Bitmaping ${chalk.greenBright(file)}`;
      await svgElement.screenshot({ omitBackground: true, path: out });
    }

    this.closeAllPages(browser);
  }

  /**
   *
   * Generate `animated` cursors bitmaps.
   *
   * @param browser `puppeteer` browser instance.
   */
  private async generateAnimatedCursors(browser: Browser) {
    for (let [cursor] of Object.entries(this.animated)) {
      // Generating HTML Template
      const { content } = this.static[`${cursor}`];
      const svgElement = this.getSvgElement(browser, content);

      // Config
      let index = 1;
      let breakRendering = false;
      const frames: Frames = {};
      const firstFrame = getFrameName(index, cursor);

      // 1st Frame
      this.spinner.text = ` Bitmaping ${chalk.greenBright(firstFrame)}`;
      frames[firstFrame] = {
        buffer: await (await svgElement).screenshot({
          omitBackground: true,
          encoding: "binary"
        })
      };

      //  Pushing frames until it match to 1st frame
      index++;
      while (!breakRendering) {
        const key = getFrameName(index, cursor);
        this.spinner.text = ` Bitmaping ${chalk.greenBright(key)}`;

        const newFrame = await (await svgElement).screenshot({
          omitBackground: true,
          encoding: "binary"
        });

        const diff = matchImages({
          img1Buff: frames[firstFrame].buffer,
          img2Buff: newFrame
        });

        const { rate } = pixelDiffRate[cursor];
        if (!(diff < rate)) {
          frames[key] = { buffer: newFrame };
        } else {
          breakRendering = true;
        }
        index++;
      }
    }
  }

  /**
   *
   * Generate cursors `bitmaps`.
   */
  public async generate() {
    const browser = await puppeteer.launch({
      ignoreDefaultArgs: [" --single-process ", "--no-sandbox"],
      headless: true
    });

    try {
      this.spinner.color = "yellow";

      await this.generateStaticCursors(browser);
      await this.generateAnimatedCursors(browser);

      this.spinner.text = ` ${chalk.blueBright(
        this.themeName
      )} bitmaps stored at ${chalk.greenBright(`${this.bitmapsDir}`)}`;

      this.spinner.succeed();
    } catch (error) {
      console.error(error);
      this.spinner.fail();
    }
  }
}
