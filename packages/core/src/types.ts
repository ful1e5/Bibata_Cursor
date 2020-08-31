interface Config {
  staticCursors: string[];
  animatedCursors: string[];
  bitmapsDir: string;
}

interface Frames {
  [fileName: string]: {
    buffer: Buffer;
  };
}

export { Config, Frames };
