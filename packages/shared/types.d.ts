type AnimatedCursors = {
  [name: string]: {
    frames: number;
  };
};

type AnimatedClip = {
  x: number;
  y: number;
  width: number;
  height: number;
};

interface RenderConfig {
  staticSvgs: Array<string>;
  animatedCursors: AnimatedCursors;
  animatedClip: AnimatedClip;
  bitmapsDir: string;
  svgsDir: string;
}
