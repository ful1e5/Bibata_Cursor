import { createBitmaps } from "bibata-core";
import { themeColors } from "./colors";
import { resolve } from "path";

const main = async () => {
  const projectRoot = resolve("../../");
  const args = {
    themeName: "Bibata-Modern",
    svgDir: resolve("./src/svg"),
    bitmapsDir: resolve(projectRoot, "bitmaps"),
    themeColors
  };

  try {
    await createBitmaps(args);
    process.exit(0);
  } catch (error) {
    console.error(error);
  }
};

main();
