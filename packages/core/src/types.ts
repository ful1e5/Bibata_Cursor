interface Config {
  staticCursors: string[];
  animatedCursors: string[];
  bitmapsDir: string;
}

interface PathConfig {
  rawSvgsDir: string;
  schemesPath: string;
  bitmapsPath: string;
  animatedCursors: string[];
  staticCursors: string[];
}

interface Frames {
  [fileName: string]: {
    buffer: Buffer;
  };
}

type Colors = {
  base: string;
  outline: string;
  watch?: {
    background: string;
  };
};

interface ThemeColors {
  [themeName: string]: Colors;
}

interface PixelDiffRate {
  [name: string]: {
    rate: number;
  };
}

export { Config, Frames, Colors, ThemeColors, PathConfig, PixelDiffRate };
