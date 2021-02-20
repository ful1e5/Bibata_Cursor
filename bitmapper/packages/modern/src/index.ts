import path from "path";

import { BitmapsGenerator, SVGHandler } from "bibata-core";
import { Colors } from "bibata-core/src/types";

const root = path.resolve(__dirname, "../../../../");
const svgDir = path.resolve(root, "svg", "modern");

const themeName = "Bibata-Modern";
const bitmapsDir = path.resolve(root, "bitmaps", themeName);

const color: Colors = {
	base: "#000000",
	outline: "#FFFFFF",
	watch: {
		background: "#FFFFFF",
	},
};

const main = async () => {
	const SVG = new SVGHandler.SvgDirectoryParser(svgDir);

	const png = new BitmapsGenerator(bitmapsDir);
	const browser = await png.getBrowser();

	for (let { key, content } of SVG.getStatic()) {
		content = SVGHandler.colorSvg(content, color);
		await png.generateStatic(browser, content, key);
	}

	for (let { key, content } of SVG.getAnimated()) {
		content = SVGHandler.colorSvg(content, color);
		await png.generateAnimated(browser, content, key);
	}

	await browser.close();
};

main();
