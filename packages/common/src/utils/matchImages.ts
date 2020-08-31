import { PNG } from "pngjs";
import pixelmatch from "pixelmatch";

interface MatchImagesArgs {
  img1Buff: Buffer;
  img2Buff: Buffer;
}

export const matchImages = ({ img1Buff, img2Buff }: MatchImagesArgs) => {
  const img1 = PNG.sync.read(img1Buff);
  const img2 = PNG.sync.read(img2Buff);
  const { width, height } = img1;

  const diff = new PNG({ width, height });

  return pixelmatch(img1.data, img2.data, diff.data, width, height, {
    threshold: 0.25
  });
};
