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

interface ColorSchemes {
  [name: string]: {
    base: string;
    outline: string;
    watch?: {
      background: string;
    };
  };
}

export { Config, Frames, ColorSchemes, PathConfig };
