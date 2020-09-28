import fs from "fs";
import path from "path";
import SvgDirectoryParser from "./SvgDirectoryParser";
import { Colors } from "../types";

export type Inputs = { svgDir: string; colors: Colors };

export interface Cursors {
  [cursorName: string]: {
    content: string;
  };
}

export const keyColors: Colors = {
  watch: {
    background: "#FF0000"
  },
  base: "#00FF00",
  outline: "#0000FF"
};

export default class ColoredSvgGenerator {
  private staticCursors: string[];
  private animatedCursors: string[];

  /**
   *
   * Generate custom color cursor's `.svg`.
   *
   * @param svgDir directory where animated & static cursors located.
   *
   * `svgDir` must contain sub-directory `static` and `animated`.
   *
   * Example: `svgs/static`, `svgs/animated`
   *
   * @param colors `Colors` for static cursors.
   */
  constructor(private inputs: Inputs) {
    const svgParser = new SvgDirectoryParser(this.inputs.svgDir);
    this.animatedCursors = svgParser.getAnimatedCursors();
    this.staticCursors = svgParser.getStaticCursors();
  }

  /**
   *
   * Generate `static` cursors .svg file according to `Theme Colors`.
   *
   */
  public getColoredStaticCursors(): Cursors {
    const cursors: Cursors = {};

    this.staticCursors.map((cursor: string) => {
      let content = fs.readFileSync(cursor, "utf-8").toString();

      content = content
        .replace(new RegExp(keyColors.base, "g"), this.inputs.colors.base)
        .replace(
          new RegExp(keyColors.outline, "g"),
          this.inputs.colors.outline
        );

      cursors[`${path.basename(cursor, ".svg")}`] = { content };
    });

    return cursors;
  }

  /**
   *
   * Generate `animated` cursors .svg file according to `Theme Colors`.
   *
   */
  public getColoredAnimatedCursors(): Cursors {
    const cursors: Cursors = {};

    this.animatedCursors.map((cursor: string) => {
      let content = fs.readFileSync(cursor, "utf-8").toString();

      content = content
        .replace(new RegExp(keyColors.base, "g"), this.inputs.colors.base)
        .replace(
          new RegExp(keyColors.outline, "g"),
          this.inputs.colors.outline
        );

      try {
        // === trying to replace `watch` color ===

        if (!this.inputs.colors.watch?.background) {
          throw new Error("");
        }
        const { background: b } = this.inputs.colors.watch;
        content = content.replace(
          new RegExp(keyColors.watch!.background, "g"),
          b
        ); // Watch Background
      } catch (error) {
        // === on error => replace `watch` color as `base` ===

        content = content.replace(
          new RegExp(keyColors.watch!.background, "g"),
          this.inputs.colors.base
        );
      }

      cursors[`${path.basename(cursor, ".svg")}`] = { content };
    });

    return cursors;
  }
}
