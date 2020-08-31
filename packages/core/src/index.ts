// import { renderCursors } from "./render";
import { generateConfigs, GenerateConfigsArgs } from "./schema";

const createBitmaps = async ({
  pathConfig,
  colorSchemes,
  themeName
}: GenerateConfigsArgs) => {
  const configs = generateConfigs({ pathConfig, colorSchemes, themeName });
  console.log(configs);
  process.exit(0);
};

export { createBitmaps };
