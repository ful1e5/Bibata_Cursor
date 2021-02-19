import fs from "fs";
import path from "path";

import * as puppeteer from "puppeteer";

class BitmapsGenerator {
	/**
	 * Generate Png files from svg code.
	 * @param themeName Give name, So all bitmaps files are organized in one directory.
	 * @param bitmapsDir `absolute` or `relative` path, Where `.png` files will store.
	 */
	constructor(
		private bitmapsDir: string,
		private readonly themeName: string
	) {
		this.bitmapsDir = path.resolve(bitmapsDir, themeName);
		this.createDir(this.bitmapsDir);

		// TODO
		console.log(this.themeName);
	}

	/**
	 * Prepare headless browser.
	 */
	async initialize() {}

	static async create(bitmapsDir: string, themeName: string) {
		const newObject = new BitmapsGenerator(bitmapsDir, themeName);
		await newObject.initialize();
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

	protected async staticPng(page: puppeteer.Page) {
		// TODO
		console.log("Static");
		await page.close();
	}

	protected async animatedPng(page: puppeteer.Page) {
		// TODO
		console.log("animated");
		await page.close();
	}

	public async getBrowser() {
		return await puppeteer.launch({
			ignoreDefaultArgs: [" --single-process ", "--no-sandbox"],
			headless: true,
		});
	}
	public async toPng(
		browser: puppeteer.Browser,
		content: string,
		animated: boolean = false
	) {
		const page = await browser.newPage();
		await page.setContent(content);

		animated ? this.animatedPng(page) : this.staticPng(page);
	}
}
export { BitmapsGenerator };
