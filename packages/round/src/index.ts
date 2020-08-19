import { renderCursors, spinner } from "shared";

import { generateConfigs } from "./helpers/schema";
import { colorSchemes } from "./color";

(async () => {
  const prefix = "Bibata-Round";
  const configs = generateConfigs(colorSchemes, prefix);

  try {
    for (let [schema] of Object.entries(configs)) {
      spinner.text = `Generating ${prefix}-${schema} bitmaps`;
      spinner.start();

      await renderCursors(configs[schema]);

      spinner.succeed();
    }

    console.log("\n🎉 Render Done.");
  } catch (error) {
    spinner.fail();
    console.error(error);
  } finally {
    process.exit(0);
  }
})();
