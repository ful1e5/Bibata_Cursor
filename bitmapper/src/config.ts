import path from "path";

const projectRoot = path.resolve("../");
const paths = {
  modern: path.resolve(projectRoot, "svg", "modern"),
  original: path.resolve(projectRoot, "svg", "original"),
  bitmaps: path.resolve(projectRoot, "bitmaps"),
};

// Colors
const palette = {
  black: "#000000",
  white: "#FFFFFF",
  amber: "#FF8300",
  richBlack: "#001524",
};

const colors = {
  amber: {
    base: palette.amber,
    outline: palette.white,
    watch: {
      background: palette.richBlack,
    },
  },
  classic: {
    base: palette.black,
    outline: palette.white,
  },
  ice: {
    base: palette.white,
    outline: palette.black,
  },
};

export { paths, colors };
