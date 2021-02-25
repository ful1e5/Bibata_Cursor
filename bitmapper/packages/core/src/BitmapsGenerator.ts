import fs from "fs";
import path from "path";

import puppeteer, { Browser, ElementHandle, Page } from "puppeteer";

import { frameNumber } from "./util/frameNumber";
import { matchImages } from "./util/matchImages";
import { toHTML } from "./util/toHTML";

class BitmapsGenerator {
	/**
	 * Generate Png files from svg code.
	 * @param themeName Give name, So all bitmaps files are organized in one directory.
	 * @param bitmapsDir `absolute` or `relative` path, Where `.png` files will store.
	 */
	constructor(private bitmapsDir: string) {
		this.bitmapsDir = path.resolve(bitmapsDir);
		this.createDir(this.bitmapsDir);
	}

	/**
	 * Create directory if it doesn't exists.
	 * @param dirPath directory `absolute` path.
	 */
	private createDir(dirPath: string) {
		if (!fs.existsSync(dirPath)) {
			fs.mkdirSync(dirPath, { recursive: true });
		}
	}

	/**
	 * Prepare headless browser.
	 */
	public async getBrowser(): Promise<Browser> {
		return await puppeteer.launch({
			ignoreDefaultArgs: ["--no-sandbox"],
			headless: true,
		});
	}

	private async getSvgElement(
		page: Page,
		content: string
	): Promise<ElementHandle<Element>> {
		if (!content) {
			throw new Error(`${content} File Read error`);
		}

		const html = toHTML(content);
		await page.setContent(html);

		const svg = await page.$("#container svg");

		if (!svg) {
			throw new Error("svg element not found!");
		}
		return svg;
	}

	public async generateStatic(
		browser: Browser,
		content: string,
		key: string
	) {
		const page = await browser.newPage();
		const svg = await this.getSvgElement(page, content);

		const out = path.resolve(this.bitmapsDir, `${key}.png`);

		await svg.screenshot({ omitBackground: true, path: out });
		await page.close();
	}

	private async screenshot(
		element: ElementHandle<Element>
	): Promise<Buffer | string> {
		const buffer = await element.screenshot({
			encoding: "binary",
			omitBackground: true,
		});

		if (!buffer) {
			throw new Error("SVG element screenshot not working");
		}
		return buffer;
	}

	private async stopAnimation(page: Page) {
		//@ts-ignore
		await page._client.send("Animation.setPlaybackRate", {
			playbackRate: 0,
		});
	}

	private async resumeAnimation(page: Page, playbackRate: number) {
		//@ts-ignore
		await page._client.send("Animation.setPlaybackRate", {
			playbackRate,
		});
	}

	private async saveFrameImage(key: string, frame: Buffer | string) {
		const out_path = path.resolve(this.bitmapsDir, key);
		fs.writeFileSync(out_path, frame);
	}

	public async generateAnimated(
		browser: Browser,
		content: string,
		key: string,
		options: {
			playbackRate: number;
			diff: number;
			frameLimit: number;
			framePadding: number;
		} = {
			playbackRate: 0.3,
			diff: 0,
			frameLimit: 300,
			framePadding: 4,
		}
	) {
		const page = await browser.newPage();
		const svg = await this.getSvgElement(page, content);
		await this.stopAnimation(page);

		let index = 1;
		let breakRendering = false;
		let prevImg: Buffer | string;

		// Rendering frames till `imgN` matched to `imgN-1` (When Animation is done)
		while (!breakRendering) {
			if (index > options.frameLimit) {
				throw new Error("Reached the frame limit.");
			}

			this.resumeAnimation(page, options.playbackRate);
			const img: string | Buffer = await this.screenshot(svg);
			this.stopAnimation(page);

			if (index > 1) {
				// @ts-ignore
				const diff = matchImages(prevImg, img);
				if (diff <= options.diff) {
					breakRendering = !breakRendering;
				}
			}
			const number = frameNumber(index, options.framePadding);
			const frame = `${key}-${number}.png`;

			this.saveFrameImage(frame, img);

			prevImg = img;
			++index;
		}

		await page.close();
	}
}
export { BitmapsGenerator };
