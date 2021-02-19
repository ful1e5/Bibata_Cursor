import fs from "fs";
import path from "path";

class SvgDirectoryParser {
	/**
	 * Manage and Parse SVG file path in `absolute` fashion.
	 * This Parser look svg files as below fashion:
	 * `
	 *  <@svgDir>/static
	 *  <@svgDir>/animated
	 * `
	 * @param svgDir is relative/absolute path, Where `SVG` files are stored.
	 */
	semiAnimated: boolean = false;
	constructor(private svgDir: string) {
		if (!fs.existsSync(this.svgDir)) {
			throw new Error(`SVG files not found in ${this.svgDir}`);
		}
	}

	/**
	 * Return absolute paths array of SVG files located inside '@svgDir/static'
	 */
	public getStatic(): string[] {
		const staticDir = path.resolve(this.svgDir, "static");

		if (!fs.existsSync(staticDir)) {
			console.log(`${this.svgDir} contains semi-animated .svg files`);
			this.semiAnimated = true;
			return [];
		} else {
			const staticCursors = fs
				.readdirSync(staticDir)
				.map((f) => path.resolve(staticDir, f));

			if (staticCursors.length == 0) {
				throw new Error("Static Cursors directory is empty");
			}
			return staticCursors;
		}
	}

	/**
	 * Return absolute paths array of SVG files located inside '@svgDir/animated'
	 */
	public getAnimated(): string[] {
		const animatedDir = path.resolve(this.svgDir, "animated");

		if (!fs.existsSync(animatedDir)) {
			throw new Error("Animated Cursors directory not found");
		}

		const animatedCursors = fs
			.readdirSync(animatedDir)
			.map((f) => path.resolve(animatedDir, f));

		if (animatedCursors.length == 0 && this.semiAnimated) {
			throw new Error(
				`Can't parse svg directory ${this.svgDir} as semi-animated theme`
			);
		}

		return animatedCursors;
	}
}

export { SvgDirectoryParser };
