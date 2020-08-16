import { generateConfigs } from "./helpers/schema";
import { colorSchemes, rawSvgsDir } from "./config";

// from shared package
import { renderCursors } from "shared";

(async () => {
  // Svg generate dir prefix
  const prefix = "Bibata-Round";
  const configs = generateConfigs(colorSchemes, prefix, rawSvgsDir);

  try {
    for (let [schema, { bitmapsDir }] of Object.entries(configs)) {
      console.log(`\nGenerating ${prefix}-${schema} bitmaps..`);
      await renderCursors(configs[schema]);
      console.log(`\nBitmaps stored at ${bitmapsDir}`);
    }
    console.log("\n\n🎉 Render Done.");
  } catch (error) {
    console.error(error);
  } finally {
    process.exit(0);
  }
})();
