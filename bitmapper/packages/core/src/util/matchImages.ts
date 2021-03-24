import Pixelmatch from "pixelmatch";
import { PNG } from "pngjs";

export const matchImages = (img1: Buffer, img2: Buffer): number => {
        const { data: img1Data, width, height } = PNG.sync.read(img1);
        const { data: imgNData } = PNG.sync.read(img2);

        return Pixelmatch(img1Data, imgNData, null, width, height, {
                threshold: 0.1,
        });
};
