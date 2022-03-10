import { SVGHandler, BitmapsGenerator } from "#root/modules";

interface BuildBitmapsArgs {
  dir: string;
  out: string;
  themeName: string;
  colors: SVGHandler.Colors;
}

const buildBitmaps = async (args: BuildBitmapsArgs) => {
  console.log("Generating bitmaps for", args.themeName);

  const svg = new SVGHandler.SvgDirectoryParser(args.dir);

  const png = new BitmapsGenerator(args.out);
  const browser = await png.getBrowser();

  for (let { key, content } of svg.getStatic()) {
    console.log(" ==> Saving", key, "...");
    content = SVGHandler.colorSvg(content, args.colors);
    await png.generateStatic(browser, content, key);
  }

  for (let { key, content } of svg.getAnimated()) {
    console.log(" ==> Saving", key, "...");
    content = SVGHandler.colorSvg(content, args.colors);
    await png.generateAnimated(browser, content, key);
  }

  await browser.close();
};

export { BuildBitmapsArgs, buildBitmaps };
