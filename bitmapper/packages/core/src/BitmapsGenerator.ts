import fs from "fs";
import path from "path";

import puppeteer, { Browser } from "puppeteer";

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

	// 	private async screenshot(
	// 		element: ElementHandle<Element>
	// 	): Promise<string | void | Buffer> {
	// 		return element.screenshot({
	// 			omitBackground: true,
	// 			encoding: "binary",
	// 		});
	// 	}

	// 	private async stopAnimation(page: Page) {
	// 		// @ts-ignore
	// 		await page._client.send("Animation.setPlaybackRate", {
	// 			playbackRate: 0,
	// 		});
	// 	}
	//
	// 	private async resumeAnimation(page: Page, playbackRate: number = 0.1) {
	// 		// @ts-ignore
	// 		await page._client.send("Animation.setPlaybackRate", {
	// 			playbackRate,
	// 		});
	// 	}
	//
	// 	private async saveFrameImage(key: string, frame: Buffer) {
	// 		const out_path = path.resolve(outDir, key);
	// 		fs.writeFileSync(out_path, frame, { encoding: "binary" });
	// 	}

	/**
	 * Prepare headless browser.
	 */
	public async getBrowser(): Promise<Browser> {
		return await puppeteer.launch({
			ignoreDefaultArgs: [" --single-process ", "--no-sandbox"],
			headless: true,
		});
	}
	public async generate(
		browser: Browser,
		content: string,
		out: string,
		animated: boolean = false
	) {
		if (!content) {
			throw new Error(`${content} File Read error`);
		}

		const page = await browser.newPage();
		const html = toHTML(content);
		await page.setContent(html);

		const svg = await page.$("#container svg");

		if (!svg) {
			throw new Error("svg element not found!");
		}

		if (animated) {
			console.log("animated");
		} else {
			await svg.screenshot({ omitBackground: true, path: out });
		}
	}
}
export { BitmapsGenerator };
