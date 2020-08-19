import chalk from "chalk";
import { renderCursors, spinner } from "common";

import { generateConfigs } from "./helpers/schema";
import { colorSchemes, bitmapsPath } from "./color";

(async () => {
  const prefix = "Bibata-Round";

  const configs = generateConfigs(colorSchemes, prefix);

  try {
    for (let [schema] of Object.entries(configs)) {
      spinner.text = `Generating ${chalk.magentaBright(
        `${prefix}-${schema}`
      )} bitmaps ...`;
      spinner.start();

      await renderCursors(configs[schema]);

      spinner.succeed();
    }
    console.log(`🎉 Bitmaps stored at ${bitmapsPath}`);
  } catch (error) {
    spinner.fail();
    console.error(error);
  } finally {
    process.exit(0);
  }
})();
