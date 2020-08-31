import fs from "fs";
import path from "path";
import { Frames } from "../types";

interface SaveFramesArgs {
  frames: Frames;
  bitmapsDir: string;
}

export const saveFrames = ({ frames, bitmapsDir }: SaveFramesArgs) => {
  for (let [fileName, { buffer }] of Object.entries(frames)) {
    const out_path = path.resolve(bitmapsDir, fileName);
    fs.writeFileSync(out_path, buffer, { encoding: "binary" });
  }
};
