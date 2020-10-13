import fs from "fs";
import path from "path";
import chalk from "chalk";
import ora, { Ora } from "ora";
import puppeteer, { Browser, ElementHandle } from "puppeteer";
import ColoredSvgGenerator, {
  Cursors,
  ThemeConfig
} from "./SvgHandler/ColoredSvgGenerator";
import { Frames } from "./types";
import { getFrameName } from "./utils/getFrameName";
import { generateRenderTemplate } from "./utils/htmlTemplate";
import { matchImages } from "./utils/matchImages";

export class BitmapsGenerator {
  private readonly staticCurs: Cursors;
  private readonly animatedCurs: Cursors;

  /**
   * @param source `BitmapsGenerator` Class's object arguments.
   * @param themeName name of the bitmaps directory.
   * @param bitmapsDir `absolute` or `relative` path, Where cursors `.png` files generated.
   */
  constructor(
    private readonly source: ThemeConfig,
    private readonly themeName: string,
    private bitmapsDir: string
  ) {
    this.bitmapsDir = path.resolve(bitmapsDir, themeName);
    this.createDir(this.bitmapsDir);

    const themeSvgs = new ColoredSvgGenerator(this.source);
    this.staticCurs = themeSvgs.getStaticCursors();
    this.animatedCurs = themeSvgs.getAnimatedCursors();
  }

  /**
   * Create directory if it doesn't exists.
   * @argument dirPath directory `absolute` or `relative` path.
   */
  private createDir(dirPath: string) {
    dirPath = path.resolve(dirPath);

    if (!fs.existsSync(dirPath)) {
      fs.mkdirSync(dirPath, { recursive: true });
    }
  }

  /**
   * @argument browser `puppeteer` browser instance.
   * @argument content `.svg` file code.
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
   * Close all pages of `Puppeteer.Browser`.
   * @argument browser `puppeteer` browser instance.
   */
  private async closeAllPages(browser: Browser) {
    const pages = await browser.pages();
    pages.map((page) => page.close());
  }

  /**
   * Generate `static` cursors bitmaps.
   * @argument browser `puppeteer` browser instance.
   * @argument spinner `Ora` instance.
   */
  private async renderStaticCurs(browser: Browser, spinner: Ora) {
    for (let [cursor] of Object.entries(this.staticCurs)) {
      // Generating HTML Template
      const { content } = this.staticCurs[cursor];

      // Configs
      const file = `${cursor}.png`;
      const out = path.resolve(this.bitmapsDir, file);
      const svgElement = await this.getSvgElement(browser, content);

      // Render
      spinner.text = ` Rendering ${chalk.greenBright(cursor)}`;
      await svgElement.screenshot({ omitBackground: true, path: out });
    }

    await this.closeAllPages(browser);
  }

  /**
   * Save animated cursors frames.
   * @argument frames Record of `binary` Buffer.
   */
  private saveFrames(frames: Frames) {
    for (let [cursor, { buffer }] of Object.entries(frames)) {
      const out_path = path.resolve(this.bitmapsDir, cursor);
      fs.writeFileSync(out_path, buffer, { encoding: "binary" });
    }
  }
  /**
   * Generate `animated` cursors bitmaps.
   * @argument browser `puppeteer` browser instance.
   * @argument spinner `Ora` instance.
   */
  private async renderAnimatedCurs(browser: Browser, spinner: Ora) {
    for (let [cursor] of Object.entries(this.animatedCurs)) {
      // Generating HTML Template
      const { content } = this.animatedCurs[cursor];

      const svgElement = await this.getSvgElement(browser, content);

      // Config
      let index = 1;
      let breakRendering = false;
      const frames: Frames = {};
      const firstFrame = getFrameName(index, cursor);

      // 1st Frame
      spinner.text = ` Rendering ${chalk.greenBright(firstFrame)}`;
      frames[firstFrame] = {
        buffer: await svgElement.screenshot({
          omitBackground: true,
          encoding: "binary"
        })
      };

      //  Pushing frames until it match to 1st frame
      index++;
      while (!breakRendering) {
        const key = getFrameName(index, cursor);
        spinner.text = ` Rendering ${chalk.greenBright(key)}`;

        const newFrame = await svgElement.screenshot({
          omitBackground: true,
          encoding: "binary"
        });

        const matched = matchImages({
          img1Buff: frames[firstFrame].buffer,
          img2Buff: newFrame
        });

        if (matched) {
          breakRendering = true;
        } else {
          frames[key] = { buffer: newFrame };
          setTimeout(() => {}, 1);
          index++;
        }
      }

      this.saveFrames(frames);
    }

    await this.closeAllPages(browser);
  }

  /**
   * Generate cursors `bitmaps`.
   */
  public async generate() {
    const spinner = ora();
    spinner.text = ` Preparing ${this.themeName} .svg files...`;
    spinner.start();

    // About browser args => https://chromium.googlesource.com/chromium/src/+/master/docs/linux/suid_sandbox_development.md#disabling-the-sandbox
    // Issue => https://github.com/ful1e5/Bibata_Cursor/issues/75#issuecomment-703236554
    const browser = await puppeteer.launch({
      ignoreDefaultArgs: [" --single-process ", "--no-sandbox"],
      headless: true
    });

    try {
      spinner.color = "yellow";
      await this.renderStaticCurs(browser, spinner);
      await this.renderAnimatedCurs(browser, spinner);

      spinner.text = ` ${chalk.blueBright(
        this.themeName
      )} bitmaps stored at ${chalk.greenBright(`${this.bitmapsDir}`)}`;

      spinner.succeed();
    } catch (error) {
      console.error(error);
      process.exit(1);
      spinner.fail();
    }
  }
}
