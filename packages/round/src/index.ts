import { renderCursors } from "shared";

import { generateConfigs } from "./helpers/schema";
import { colorSchemes } from "./color";

(async () => {
  const prefix = "Bibata-Round";
  const configs = generateConfigs(colorSchemes, prefix);

  try {
    for (let [schema] of Object.entries(configs)) {
      await renderCursors(configs[schema]);
    }

    console.log("\n🎉 Render Done.");
  } catch (error) {
    console.error(error);
  } finally {
    process.exit(0);
  }
})();
