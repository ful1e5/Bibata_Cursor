import { createBitmaps } from "bibata-core";
import { themeColors } from "./color";

import { resolve } from "path";

const projectRoot = resolve("../../");
const args = {
  themeName: "Bibata-Modern",
  svgDir: resolve("./src/svg"),
  bitmapsDir: resolve(projectRoot, "bitmaps"),
  themeColors
};

createBitmaps(args);
