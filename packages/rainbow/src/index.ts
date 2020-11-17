import { createBitmaps } from "bibata-core";
import { themeColors } from "./colors";
import { resolve } from "path";

const main = async () => {
  const projectRoot = resolve("../../");
  const modernArgs = {
    themeName: "Bibata-Modern",
    svgDir: resolve("./src/svgs/modern"),
    bitmapsDir: resolve(projectRoot, "bitmaps"),
    themeColors
  };

  const originalArgs = {
    themeName: "Bibata-Original",
    svgDir: resolve("./src/svgs/original"),
    bitmapsDir: resolve(projectRoot, "bitmaps"),
    themeColors
  };

  try {
    await createBitmaps(modernArgs);
    await createBitmaps(originalArgs);
    process.exit(0);
  } catch (error) {
    console.error(error);
  }
};

main();
