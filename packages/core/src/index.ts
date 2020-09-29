import { BitmapsGenerator } from "./BitmapsGenerator";
import { ThemeColors } from "./types";

const createBitmaps = async (config: {
  themeColors: ThemeColors;
  svgDir: string;
  themeName: string;
  bitmapsDir: string;
}) => {
  for (let [variant] of Object.entries(config.themeColors)) {
    const colors = config.themeColors[variant];
    const source = {
      svgDir: config.svgDir,
      colors
    };

    const themeBitmaps = new BitmapsGenerator(
      source,
      config.themeName,
      config.bitmapsDir
    );

    themeBitmaps.generate();
  }
};

export { createBitmaps };
