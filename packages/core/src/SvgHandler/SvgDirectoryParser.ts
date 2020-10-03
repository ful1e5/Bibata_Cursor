import fs from "fs";
import path from "path";

export default class SvgDirectoryParser {
  /**
   * Parse the `.svg` files directory.
   * @param svgDir is relative/absolute path, Where source `.svg` files are stored.
   */
  constructor(private svgDir: string) {
    if (!fs.existsSync(this.svgDir)) {
      throw new Error(`🚨 .svg files not found in ${this.svgDir}`);
    }
  }

  /**
   * Return all static cursors absolute paths from `svgDir/static` directory.
   */
  public getStaticCursors(): string[] {
    const cursorDir = path.resolve(this.svgDir, "static");

    if (!fs.existsSync(cursorDir)) {
      throw new Error("🚨 Static Cursors directory not found");
    }

    const staticCursors = fs
      .readdirSync(cursorDir)
      .map((f) => path.resolve(cursorDir, f));

    if (staticCursors.length == 0) {
      console.warn("Static Cursors directory is empty");
    }

    return staticCursors;
  }

  /**
   * Return all animated cursors absolute paths from `svgDir/animated` directory.
   */
  public getAnimatedCursors(): string[] {
    const cursorDir = path.resolve(this.svgDir, "animated");

    if (!fs.existsSync(cursorDir)) {
      throw new Error("🚨 Animated Cursors directory not found");
    }

    const animatedCursors = fs
      .readdirSync(cursorDir)
      .map((f) => path.resolve(cursorDir, f));

    if (animatedCursors.length == 0) {
      console.warn("Animated Cursors directory is empty");
    }

    return animatedCursors;
  }
}
