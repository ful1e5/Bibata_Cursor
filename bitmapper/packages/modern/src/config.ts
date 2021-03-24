import { Colors } from "bibata-core/src/types";

interface Config {
  themeName: string;
  color: Colors;
}

const black = "#000000";
const white = "#FFFFFF";
const amber = "#FF8300";
const richBlack = "#001524";

const config: Config[] = [
  {
    themeName: "Bibata-Modern-Amber",
    color: {
      base: amber,
      outline: white,
      watch: {
        background: richBlack,
      },
    },
  },
  {
    themeName: "Bibata-Modern-Classic",
    color: {
      base: black,
      outline: white,
    },
  },
  {
    themeName: "Bibata-Modern-Ice",
    color: {
      base: white,
      outline: black,
    },
  },
];

export { config };
