import fs from "fs";
import path from "path";
import SvgDirectoryParser from "./SvgDirectoryParser";
import { Colors } from "../types";

export type ThemeConfig = { svgDir: string; colors: Colors };

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
  private staticCurs: string[];
  private animatedCurs: string[];

  /**
   * Generate custom color cursor's `.svg`.
   * @param svgDir directory where animated & static cursors located.
   * `svgDir` must contain sub-directory `static` and `animated`.
   *
   * Example: `svgs/static`, `svgs/animated`
   * @param colors `Colors` for static cursors.
   */
  constructor(private readonly themeConfig: ThemeConfig) {
    const svgParser = new SvgDirectoryParser(this.themeConfig.svgDir);
    this.animatedCurs = svgParser.getAnimatedCursors();
    this.staticCurs = svgParser.getStaticCursors();
  }

  /**
   * Generate `static` cursors .svg file according to `Theme Colors`.
   */
  public getStaticCursors(): Cursors {
    const cursors: Cursors = {};

    this.staticCurs.map((cursor: string) => {
      let content = fs.readFileSync(cursor, "utf-8").toString();

      content = content
        .replace(new RegExp(keyColors.base, "ig"), this.themeConfig.colors.base)
        .replace(
          new RegExp(keyColors.outline, "ig"),
          this.themeConfig.colors.outline
        );

      cursors[`${path.basename(cursor, ".svg")}`] = { content };
    });

    return cursors;
  }

  /**
   * Generate `animated` cursors .svg file according to `Theme Colors`.
   */
  public getAnimatedCursors(): Cursors {
    const cursors: Cursors = {};

    this.animatedCurs.map((cursor: string) => {
      let content = fs.readFileSync(cursor, "utf-8").toString();

      content = content
        .replace(new RegExp(keyColors.base, "ig"), this.themeConfig.colors.base)
        .replace(
          new RegExp(keyColors.outline, "ig"),
          this.themeConfig.colors.outline
        );

      try {
        // === trying to replace `watch` color ===

        if (!this.themeConfig.colors.watch?.background) {
          throw new Error("");
        }
        const { background: b } = this.themeConfig.colors.watch;
        content = content.replace(
          new RegExp(keyColors.watch!.background, "ig"),
          b
        ); // Watch Background
      } catch (error) {
        // === on error => replace `watch` color as `base` ===

        content = content.replace(
          new RegExp(keyColors.watch!.background, "ig"),
          this.themeConfig.colors.base
        );
      }

      cursors[`${path.basename(cursor, ".svg")}`] = { content };
    });

    return cursors;
  }
}
