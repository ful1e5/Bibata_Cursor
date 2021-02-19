import path from "path";

import { BitmapsGenerator, SVGHandler } from "bibata-core";

const root = path.resolve(__dirname, "../../../../");
const svgDir = path.resolve(root, "svg", "modern");

const main = async () => {
	const SVG = new SVGHandler.SvgDirectoryParser(svgDir);

	SVG.getStatic().forEach((svg) => {
		console.log(svg);
	});

	SVG.getAnimated().forEach((svg) => {
		console.log(svg);
	});
};

main();
