# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

## [v2.0.7] - 18 June 2024

### :warning: Changes for Developers/Package Distributors

> **Note**
> This change applies only to developers and package distributors

-   The `build.toml` and `build.right.toml` files have been removed. Instead, the cursor build configurations are now distributed according to platforms within the `configs` directory:
    -   `configs/normal/x.build.toml`: Used to build normal XCursor.
    -   `configs/normal/win_rg.build.toml`: Used to build normal regular size Windows cursors.
    -   `configs/normal/win_lg.build.toml`: Used to build normal large size Windows cursors.
    -   `configs/normal/win_xxl.build.toml`: Used to build normal extra large size Windows cursors.
    -   `configs/right/x.build.toml`: Used to build right XCursor.
    -   `configs/right/win_rg.build.toml`: Used to build right regular size Windows cursors.
    -   `configs/right/win_lg.build.toml`: Used to build right large size Windows cursors.
    -   `configs/right/win_xxl.build.toml`: Used to build right extra large size Windows cursors.

### What's New?

-   Redesign hands cursor for `bibata-*-right` cursors (Related to #112)
-   Attach version meta-data inside cursor packages

### Issues Fixes

-   Fixes #159
-   Fixes #158
-   Fixes #161

## [v2.0.6] - 25 January 2024

### What's New?

-   Right-hand cursors themes added #112

### Issues Fixes

-   Fixes #158

## [v2.0.5] - 31 September 2023

### What's New?

-   Refresh cursor designs
-   Static Cursor Animation frames to reduce package size

### Changes

-   Old Bibata cursors(Sharp) for 'Bibata Original'

### Issues Fixes

-   Cursor Hotspot set according to `256x256px` image
-   Fixed #157
-   Fixed #151
-   Fixed #146
-   Fixed #154
-   Fixed #150

## [v2.0.4] - 15 September 2023

### :warning: Breaking Changes

> **Note**
> This change applies only to developers and package distributors

-   3b54187660de06d8b117ecbf191c93826bcc1fc8 The 'bitmaps' directory has been removed from the git repository. You can now generate the PNG files using `yarn render` or download them from the release assets.

### What's New?

-   Pointer Actions Cursor is Re-Designed
    ![Screenshot_20230915_101854](https://github.com/ful1e5/Bibata_Cursor/assets/24286590/2ea91fb0-7338-4886-872a-a871230325f1)

-   The XCursor package size is now approximately `20MB` in its original form and `~2MB` when compressed.
-   Official Distributing `16` and `20` XCursors (Fixes #129)
-   The maximum size for building a cursor without losing quality is `256px`.
-   Animated cursors now have fewer frames, Fixes #134.
-   Resolved Missing Windows Cursors. (Fixes #133, #124)
-   Using [cbmp v1.0.0](https://github.com/ful1e5/cbmp/tree/v1.0.0) for rendering cursor bitmaps.

### Changes

-   Use 'xz' for better compression in `release` script #140
-   Corrected the AUR Package information in `README.md`, addressing issue #142.

### Issues Fixes

-   docs: Added list of websites for testing cursor states in README (fixed #123)

## [v2.0.3] - 06 December 2022

### Added

-   Use green for copy
-   Simplify move emblem
-   Simplify link emblem
-   Use orange for dnd-ask

### Changed

-   chore: Removed default hotspots assignments from `build.toml`
-   chore: Symlink `dnd-move` with `grabbing` cursor
-   chore: Simplify svg code

## [v2.0.2] - 10 October 2022

### Changed

-   refactor: bitmapper moved to individual project [cbmp](https://github.com/ful1e5/cbmp)
-   Fix blurry Windows Cursors in Small versions #119 #116
-   Fix custom outline and base color #104

## [v2.0.1] - 03 October 2022

### Changed

-   Fix transparency pixels distortion in XCursors #118

## [v2.0.0] - 03 October 2022

### Added

-   feat: Resize-arrow cursors got redesign
-   tidy docs inside `README.md`
-   symlink common cursor svg files using `svg/link.py` (for developers)
-   Add cursor top_left_arrow cursor ful1e5/BreezeX_Cursor#10 ful1e5/BreezeX_Cursor#11
-   Uninstall docs ful1e5/apple_cursor#79 ful1e5/apple_cursor#80
-   feat: CLI for bitmapper #104
-   doc: build docs updated

### Changed

-   prettier `bitmapping` logs
-   README.md: removed nonsense and included theme names with description. (fixed #113)
-   Fix [Modern Classic] I-Beam cursor is blurry #117
-   Make Outline more visible in cursors

## [v1.1.2] - 12 July 2021

### Added

-   Support button inside `PLING.bbcode` product page
-   `make prepare` command for preparing bibata binaries
-   `pyrightconfig.json` init

### Changed

-   Removed **clean** target from `builder/Makefile`
-   Compact code inside `builder/*`
-   Remove `setup.py`
-   Builder code moved to `src`
-   Import `src` module directly inside `build.py`
-   `Makefile` build commands re-arrange with groups
-   Dynamic determine **Windows canvas size** on **Windows cursor size** inside build.py`

## [v1.1.1] - 26 March 2021

### Added

-   use `clickgen.packagers` for packaging **X11/UNIX** cursors
-   typing supports from `clickgen` (v1.1.9)
-   Set clickgen version to v1.1.9 inside `builder/setup.py`
-   `Pillow` version locked at **8.1.1** by clickgen **v1.1.9**
-   **2 Space** format in `bitmapper`
-   Sphinx based docsstring in `builder/bbpkg`

### Changed

-   Clean builder cache on every `make` commands
-   Bibata builder `bbpkg` install as system level
-   Removed python3 virtual environment from `builder/Makefile`
-   **clean** target fixed in `builder/Makefile`
-   Bibata Rainbow packages move to [own](https://github.com/ful1e5/Bibata_Cursor_Rainbow) repo
-   puppeteer `svg` element timeout fixed
-   optional options typing in `BitmapGenerator.ts`
-   Format `svg` files
-   Remove old username of an author with Contributors table

## [v1.1.0] - 26 February 2021

### Added

-   new **[copr](https://copr.fedorainfracloud.org/coprs/peterwu/rendezvous/package/bibata-cursor-themes/)**
    package by @peterwu
-   `.svg` files separated to `<root>/svg`
-   Customizable Windows & UNIX cursors #91
-   Easy build system with `Make` supports
-   Make docs in[README.md](./README.md#manual-build)
-   use builtin clickgen WinPackager for Windows package
-   Constant frames in animated cursors
-   Smooth animation in Windows cursors
-   `install` & `uninstall` with `make` commands

### Changed

-   Individual cursor build with clickgen v1.1.8 #93
-   puppeteer 'single-process' args removed
-   All Bitmapping code structured in `bitmapper` directory
-   builder code structured inside `builder` directory
-   `builder` package renamed to `bbpkg`
-   Symblinks provided by `bbpkg`(new Bibata builder)
-   Automatic build environment setup with `make`
-   Logging file removed
-   Fix dnf runtime requirements packages ful1e5/apple_cursor#34
-   Fix grabbing cursors symlinks #87
-   Fix Cursors not available for Login Window in Linux Mint 20 #88
-   Dirty pixel in `move` cursor fixed #94

## [v1.0.3] - 10 November 2020

### Added

-   Case insensitive `colors key` replace in **bibata-core**
-   **Alternate.cur** added in Windows package
-   `minimumFrames` frames handler added for animated cursors in **bibata-core**

### Changed

-   Files download reference change to [pling.com](https://www.pling.com/p/1197198/) in `PLING.bbcode`
-   Scripts in `package.json`
-   Change reference of **Alternate.cur** to `right_ptr`
-   fixed #82 improvement to X-cursor (feature request)
-   fixed #81 Corner resize cursors are not coloured (bug)

## [v1.0.2] - 30 October 2020

### Added

-   Separate **GitHib Action** workflow for **pull-request**
-   **pkg_info.py** inside `builder` module
-   `builder` module docs

### Changed

-   Windows Resize cursors wrong implementation fixed **#76** [Reopen]
-   **Rich Black** color in `watch: background` (Bibata Amber) **#78**
-   PyPi Requirements provided inside `setup.py`
-   locked clickgen to **1.1.7**
-   Package information provider module changed to `builder/pkg_info.py`

## [v1.0.1] - 08 October 2020

### Added

-   **[builder](./builder/)** python package
-   Build only **x11** cursors by passing `--x11` flag in `build.py`
-   Build only **win** cursors by passing `--win` flag in `build.py`
-   Bump up **clickgen** version to **1.1.7** (KDE cursors fix patch)
-   `22px` size added (suggestion by **@gotroot** from pling.com)

### Changed

-   Browser args changed in `bibata-core` **BitmapGenerator**
-   **yarn** scripts updated
-   **yarn-packages** description updated
-   **Installation** docs updated in [README.md](./README.md) & [PLING.bbcode](./PLING.bbcode)
-   remove additional comments in **[PULL_REQUEST_TEMPLATE.md](https://github.com/ful1e5/Bibata_Cursor/commit/085221352038a199aae99f828d64b2ae91ace493)**
-   #76 Wrong implementation resize cursors **[closed]**
-   #74 `Pillow` pip requirements checking in installation of **clickgen**

## [v1.0.0] - 03 October 2020

### Changed

-   `main` as **default** branch
-   Package **size** reduced
-   Build process with `python` & [**clickgen**](https://github.com/ful1e5/clickgen)
-   Cursors Redesign => `all_scroll`, `pencil`, `wayland_cursor`, `xcursor` and all `pointer symbols`(with Bigger Symbols) cursors
-   `Bibata Oil` is **end of life**
-   Bitmaps Rendering with [**puppeteer**](https://github.com/puppeteer/puppeteer)
-   Build Docs

### Added

-   Bibata Original (Old Bibata)
-   Windows Package with **Double Click** installation 😍
-   Maintaining [CHANGELOG.md](./CHANGELOG.md)
-   [CURSORS.md](./CURSORS.md) for all cursors information
-   [PLING.bbcode](./PLING.bbcode) for pling.com Product page docs
-   [GitHub Actions](https://github.com/ful1e5/Bibata_Cursor/actions) added
-   New Build with **10x** faster rendering.
-   Customizable Colors in **Bibata** Cursors.
-   Auto framing in animated cursors with [**pixelmatch**](https://github.com/mapbox/pixelmatch)

## [v0.4.2] - 12 January 2020

### Changed

-   same names in Oil and Classic [Fixed again]

## [v0.4.2.beta.1] - 22 December 2019

### Changed

-   Bibata Logo resigned

## [v0.4.2.alpha.2] - 01 December 2019

### Added

-   Fresh new Aminated cursors
-   Missing KDE Cursors
-   Added custom animation-delay tweak script

### Changed

-   Glitch fixed in watch cursor(loading state)
-   Bibata Amber Color changed to #FF8000
-   Bibata Oil is inspired on **adwaita gtk** theme color #272728

## [v0.4.2.alpha.1] - 13 November 2019

### Added

-   New build process using python
-   Common .svg file for all cursor source(i.e. time saving for modification)
-   Bibata Classic Flavor
-   Available for Windows user

### Changed

-   Color & Shadow changed for easy visibility
-   Cursor's corner-shape changed
-   Hot-spots changed

## [v.0.4.1] - 03 September 2018

### Changed

-   Locations Fixed
-   AUR added in README.md

## [v0.3.1] - 16 March 2018

### Changed

-   Redesign Crosshair

## [v0.3] - 03 February 2018

### Added

-   Initial release 🎊

[unreleased]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.7...main
[v2.0.7]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.6...v2.0.7
[v2.0.6]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.5...v2.0.6
[v2.0.5]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.4...v2.0.5
[v2.0.4]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.3...v2.0.4
[v2.0.3]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.2...v2.0.3
[v2.0.2]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.1...v2.0.2
[v2.0.1]: https://github.com/ful1e5/Bibata_Cursor/compare/v2.0.0...v2.0.1
[v2.0.0]: https://github.com/ful1e5/Bibata_Cursor/compare/v1.1.2...v2.0.0
[v1.1.2]: https://github.com/ful1e5/Bibata_Cursor/compare/v1.1.1...v1.1.2
[v1.1.1]: https://github.com/ful1e5/Bibata_Cursor/compare/v1.1.0...v1.1.1
[v1.1.0]: https://github.com/ful1e5/Bibata_Cursor/compare/v1.0.3...v1.1.0
[v1.0.3]: https://github.com/ful1e5/Bibata_Cursor/compare/v1.0.2...v1.0.3
[v1.0.2]: https://github.com/ful1e5/Bibata_Cursor/compare/v1.0.1...v1.0.2
[v1.0.1]: https://github.com/ful1e5/Bibata_Cursor/compare/v1.0.0...v1.0.1
[v1.0.0]: https://github.com/ful1e5/Bibata_Cursor/compare/v0.4.2...v1.0.0
[v0.4.2]: https://github.com/ful1e5/Bibata_Cursor/compare/v0.4.2.beta.1...v0.4.2
[v0.4.2.beta.1]: https://github.com/ful1e5/Bibata_Cursor/compare/v0.4.2.alpha.2...v0.4.2.beta.1
[v0.4.2.alpha.2]: https://github.com/ful1e5/Bibata_Cursor/compare/v0.4.2.alpha.1...v0.4.2.alpha.2
[v0.4.2.alpha.1]: https://github.com/ful1e5/Bibata_Cursor/compare/v0.4.1...v0.4.2.alpha.1
[v.0.4.1]: https://github.com/ful1e5/Bibata_Cursor/compare/v0.3.1...v0.4.1
[v0.3.1]: https://github.com/ful1e5/Bibata_Cursor/compare/v0.3...v0.3.1
[v0.3]: https://github.com/ful1e5/Bibata_Cursor/tree/v0.3
[v0.3]: https://github.com/ful1e5/Bibata_Cursor/tree/v0.3
