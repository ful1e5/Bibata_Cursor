import { builder } from "#root/modules";
import { colors, paths } from "#root/config";

const themes = [
  {
    themeName: "Bibata-Original-Amber",
    colors: colors.amber,
  },
  {
    themeName: "Bibata-Original-Classic",
    colors: colors.classic,
  },
  {
    themeName: "Bibata-Original-Ice",
    colors: colors.ice,
  },
];

const execute = async () => {
  for (const args of themes) {
    await builder.buildBitmaps({
      dir: paths.original,
      out: paths.bitmaps,
      ...args,
    });
  }
};

export { execute };
