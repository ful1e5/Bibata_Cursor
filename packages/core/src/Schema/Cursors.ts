import fs from "fs";
import path from "path";

export class Cursors {
  constructor(private svgDir: string) {
    if (!fs.existsSync(this.svgDir)) {
      throw new Error(`🚨 .svg files not found in ${this.svgDir}`);
    }
  }

  getStaticCursors(): string[] | null {
    const cursorDir = path.resolve(this.svgDir, "static");

    if (!fs.existsSync(cursorDir)) {
      throw new Error("🚨 Static Cursors directory not found");
    }

    const staticCursors = fs
      .readdirSync(cursorDir)
      .map((f) => path.resolve(cursorDir, f));

    if (staticCursors.length == 0) {
      return null;
    }

    return staticCursors;
  }

  getAnimatedCursors(): string[] | null {
    const cursorDir = path.resolve(this.svgDir, "animated");

    if (!fs.existsSync(cursorDir)) {
      throw new Error("🚨 Animated Cursors directory not found");
    }

    const animatedCursors = fs
      .readdirSync(cursorDir)
      .map((f) => path.resolve(cursorDir, f));

    if (animatedCursors.length == 0) {
      return null;
    }

    return animatedCursors;
  }
}
