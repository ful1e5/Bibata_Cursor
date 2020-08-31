// import { renderCursors, spinner } from "common";

import { generateConfigs } from "./utils/schema";
import * as colorsConfig from "./color";

const main = async () => {
  const themeName = "Bibata-Round";

  const configs = generateConfigs(colorsConfig.colorSchemes, themeName);

  console.log(configs);

  process.exit(0);
};

main();
