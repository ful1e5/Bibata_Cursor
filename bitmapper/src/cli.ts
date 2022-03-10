#!/usr/bin/env node
require("module-alias/register");
import path from "path";

import { Argument, Command, Option } from "commander";

import { builder } from "#root/modules";
import * as commands from "#root/commands";

import { exitWithError } from "#root/utils/exitWithError";

interface ProgramOptions {
  dir: string;
  out: string;
  themeName: string;
  baseColor: string;
  outlineColor: string;
  watchBackgroundColor?: string;
}

const cliApp = async () => {
  const program = new Command();
  let style: string = "";

  program
    .name("bibata-bitmapper")
    .version("1.1.2")
    .usage("[OPTIONS]...")

    .addArgument(
      new Argument(
        "<style>",
        "Generate bitmaps for builtin Bibata style."
      ).choices(["modern", "original"])
    )
    .action((s) => {
      style = s;
    })

    .addOption(
      new Option(
        "-d, --dir <path>",
        "Specifies the directory for placement of SVG files."
      )
    )
    .addOption(
      new Option("-o, --out <path>", "Specifies the output directory.")
    )
    .addOption(
      new Option(
        "-n, --themeName <string>",
        "Specifies the name of output directory."
      )
    )

    .addOption(
      new Option(
        "-bc, --baseColor <hex>",
        "Specifies the Hexadecimal color for inner part of cursor."
      )
    )
    .addOption(
      new Option(
        "-oc, --outlineColor <hex>",
        "Specifies the Hexadecimal color for cursor's ouline."
      )
    )
    .addOption(
      new Option(
        "-wc, --watchBackgroundColor <hex>",
        "Specifies the Hexadecimal color for animation background."
      )
    );

  if (!process.argv.slice(2).length) {
    program.outputHelp();
    process.exit(1);
  }

  // Parsing arguments
  program.parse(process.argv);
  const options: ProgramOptions = program.opts();

  switch (style) {
    case "modern": {
      await commands.modern.execute();
      break;
    }

    case "original": {
      await commands.original.execute();
      break;
    }

    default: {
      if (!options.dir) {
        exitWithError(" error: option '-d, --dir <path>' missing");
      }
      if (!options.out) {
        exitWithError(" error: option '-o, --out <path>' missing");
      }
      if (!options.themeName) {
        exitWithError(" error: option '-n, --themeName <string>' missing");
      }
      if (!options.baseColor) {
        exitWithError(" error: option '-bc, --baseColor <hex>' missing");
      }
      if (!options.outlineColor) {
        exitWithError(" error: option '-oc, --outlineColor <hex>' missing");
      }

      const colors = {
        base: options.baseColor,
        outline: options.outlineColor,
        watch: {
          background: options.watchBackgroundColor ?? options.baseColor,
        },
      };
      const bitmapsDir = path.resolve(options.out, options.themeName);

      // Logging arguments
      console.log("---");
      console.log(`SVG directory: '${options.dir}'`);
      console.log(`Output directory: '${bitmapsDir}'`);
      console.log(`Base color: '${colors.base}'`);
      console.log(`Outline color: '${colors.outline}'`);
      console.log(`Watch Background color: '${colors.watch.background}'`);
      console.log("---\n");

      builder.buildBitmaps({
        dir: options.dir,
        out: options.out,
        themeName: options.themeName,
        colors: colors,
      });
      break;
    }
  }
};

cliApp();
