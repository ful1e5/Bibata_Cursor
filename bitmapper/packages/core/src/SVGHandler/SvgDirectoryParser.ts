import fs from "fs";
import path from "path";

interface Svg {
  key: string;
  content: string;
}

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

  private readData(f: string): Svg {
    const content = fs.readFileSync(f, "utf-8");
    const key = path.basename(f, ".svg");
    return { content, key };
  }

  /**
   * Return absolute paths array of SVG files data located inside '@svgDir/static'
   */
  public getStatic(): Svg[] {
    const staticDir = path.resolve(this.svgDir, "static");

    if (!fs.existsSync(staticDir)) {
      console.log(`${this.svgDir} contains semi-animated .svg files`);
      this.semiAnimated = true;
      return [];
    } else {
      const svgs = fs
        .readdirSync(staticDir)
        .map((f) => this.readData(path.resolve(staticDir, f)));

      if (svgs.length == 0) {
        throw new Error("Static Cursors directory is empty");
      }
      return svgs;
    }
  }
  /**
   * Return absolute paths array of SVG files data located inside '@svgDir/animated'
   */
  public getAnimated(): Svg[] {
    const animatedDir = path.resolve(this.svgDir, "animated");

    if (!fs.existsSync(animatedDir)) {
      throw new Error("Animated Cursors directory not found");
    }

    const svgs = fs
      .readdirSync(animatedDir)
      .map((f) => this.readData(path.resolve(animatedDir, f)));

    if (svgs.length == 0 && this.semiAnimated) {
      throw new Error(
        `Can't parse svg directory ${this.svgDir} as semi-animated theme`
      );
    }

    return svgs;
  }
}

export { SvgDirectoryParser };
