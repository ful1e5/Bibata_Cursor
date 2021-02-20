import path from "path";
import fs from "fs";

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

	SVG.getStatic().forEach(async (svg) => {
		const key = `${path.basename(svg, ".svg")}.png`;
		console.log("Saving", key, "...");
		const out = path.resolve(bitmapsDir, key);

		let content = fs.readFileSync(svg, "utf-8");
		content = SVGHandler.colorSvg(content, color);

		await png.generate(browser, content, out);
	});
};

main();
