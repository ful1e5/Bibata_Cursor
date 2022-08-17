import { builder } from "#root/modules";
import { colors, paths } from "#root/config";

const themes = [
  {
    themeName: "Bibata-Modern-Amber",
    colors: colors.amber,
  },
  {
    themeName: "Bibata-Modern-Classic",
    colors: colors.classic,
  },
  {
    themeName: "Bibata-Modern-Ice",
    colors: colors.ice,
  },
];

const execute = async () => {
  for (const args of themes) {
    await builder.buildBitmaps({
      dir: paths.modern,
      out: paths.bitmaps,
      ...args,
    });
  }
};

export { execute };
