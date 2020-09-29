import { BitmapsGenerator } from "./BitmapsGenerator";
import { ThemeColors } from "./types";

const createBitmaps = async (config: {
  themeColors: ThemeColors;
  svgDir: string;
  themeName: string;
  bitmapsDir: string;
}): Promise<boolean> => {
  for (let [variant] of Object.entries(config.themeColors)) {
    const colors = config.themeColors[variant];
    const themeName = `${config.themeName}-${variant}`;
    const source = {
      svgDir: config.svgDir,
      colors
    };

    const themeBitmaps = new BitmapsGenerator(
      source,
      themeName,
      config.bitmapsDir
    );

    await themeBitmaps.generate();
  }
  return true;
};

export { createBitmaps };
