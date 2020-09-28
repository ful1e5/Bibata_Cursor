import { ThemeColors } from "./types";

const createBitmaps = async (config: {
  themeColors: ThemeColors;
  themeName: string;
  bitmapsDir: string;
}) => {
  console.log(config);
};

export { createBitmaps };
