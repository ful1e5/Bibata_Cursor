// import { renderCursors } from "./render";
import { generateConfigs, GenerateConfigsArgs } from "./schema";
import { renderCursors } from "./render";

const createBitmaps = async ({
  pathConfig,
  colorSchemes,
  themeName
}: GenerateConfigsArgs) => {
  const configs = generateConfigs({ pathConfig, colorSchemes, themeName });
  await renderCursors(configs);

  process.exit(0);
};

export { createBitmaps };
