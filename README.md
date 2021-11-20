# Bibata Cursor

[![build](https://github.com/ful1e5/Bibata_Cursor/actions/workflows/build.yml/badge.svg)](https://github.com/ful1e5/Bibata_Cursor/actions/workflows/build.yml)
[![CodeFactor](https://www.codefactor.io/repository/github/ful1e5/bibata_cursor/badge)](https://www.codefactor.io/repository/github/ful1e5/bibata_cursor)
[![Twitter](https://img.shields.io/badge/twitter-ful1e5-blue)](https://twitter.com/ful1e5)

Bibata is **OpenSource**, compact, and material designed cursor set. This project masterelop for improve `Cursor` experience.

- **Bibata Amber :** Yellowish Theme.
- **Bibata Classic :** Solid Black Theme.
- **Bibata Ice :** Light Theme.

## Bibata Styles

- **Bibata Original :** Sharp edge Bibata Cursors
- **Bibata Modern :** Round edge Bibata Cursors

## Cursor Sizes

<kbd>22</kbd>
<kbd>24</kbd>
<kbd>28</kbd>
<kbd>32</kbd>
<kbd>40</kbd>
<kbd>48</kbd>
<kbd>56</kbd>
<kbd>64</kbd>
<kbd>72</kbd>
<kbd>80</kbd>
<kbd>88</kbd>
<kbd>96</kbd>

## Colors

![Amber](https://imgur.com/5Jo6MSO.png)
![Classic](https://imgur.com/I5cRKE4.png)
![Ice ✓](https://imgur.com/avnR40g.png)

## Quick install

<p align="center">
  <a href="https://www.pling.com/p/1197198/" >
    <img title="Bibata Pling Store" width="40%" src="https://imgur.com/VxSgrWw.png">
  </a>
</p>

## Preview

> Check Figma file [here](https://www.figma.com/file/Y9RKZLXhSvaxpUzsKGJkp6/Bibata-Cursor?node-id=0%3A1)

<p align="center">
  <img title="Bibata Amber" width="90%" src="https://i.imgur.com/2DEYWDC.png">
  </br>
  <sub>Bibata Amber</sub>
</p>

<p align="center">
  <img title="Bibata Classic" width="90%" src="https://i.imgur.com/C8mMQ3j.png">
  </br>
  <sub>Bibata Classic</sub>
</p>

<p align="center">
  <img title="Bibata Ice" width="90%" src="https://i.imgur.com/ovzTw6u.png">
  </br>
  <sub>Bibata Ice</sub>
</p>

## Packages

> **Note**: If you're having trouble with the packages please submit a request to the package maintainer before creating an issue.

### Arch Linux/Manjaro

Arch Linux/Manjaro users can install from the [AUR](https://aur.archlinux.org/packages/bibata-cursor-theme) currently maintained by [_@Shatur_](https://aur.archlinux.org/packages/?K=Shatur&SeB=m) & [_@yochananmarqos_](https://aur.archlinux.org/packages/?K=yochananmarqos&SeB=m). Can be installed via Pamac (preinstalled in Manjaro), Yay or any other [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers).

Pamac command:

```bash
pamac build bibata-cursor-theme
pamac build bibata-cursor-theme-bin                  # pre-built binary
```

Yay command:

```bash
yay -S bibata-cursor-theme
yay -S bibata-cursor-theme-bin                       # pre-built binary
```

### Fedora

#### copr-repo by @peterwu (recommended)

**Enable the repo:**

```bash
sudo dnf copr enable peterwu/rendezvous
```

**Installation command:**

```bash
sudo dnf install bibata-cursor-themes
```

#### copr-repo by @muhalantabli

**Enable the repo:**

```bash
sudo dnf copr enable muhalantabli/copr-repo
```

**Installation command:**

```bash
sudo dnf install bibata-cursor-theme
```

## Manual Install

Latest `Stable` & `Development` releases can be downloaded from [Here](https://github.com/ful1e5/Bibata_Cursor/releases)

#### Linux/X11

```bash
# extract `Bibata.tar.gz`
tar -xvf Bibata.tar.gz

# For local users
mv Bibata-* ~/.icons/

# For all users
sudo mv Bibata-* /usr/share/icons/
```

#### Windows

1. unzip `.zip` file
2. Open unziped directory in Explorer, and **right click** on `install.inf`.
3. Click 'Install' from the context menu, and authorize the modifications to your system.
4. Open _Control Panel_ > _Personalization and Appearance_ > _Change mouse pointers_, and select **Bibata Cursors**.
5. Click '**Apply**'.

# Dependencies

## External Libraries

- libxcursor-dev
- libx11-dev
- libpng-dev (<=1.6)

#### Install External Libraries

##### macOS

```bash
brew install --cask xquartz
brew install libpng
```

##### Debain/ubuntu

```bash
sudo apt install libx11-dev libxcursor-dev libpng-dev
```

##### ArchLinux/Manjaro

```bash
sudo pacman -S libx11 libxcursor libpng
```

##### Fedora/Fedora Silverblue/CentOS/RHEL

```bash
sudo dnf install libX11-devel libXcursor-devel libpng-devel
```

## Build Dependencies

- [gcc](https://gcc.gnu.org/install/)
- [make](https://www.gnu.org/software/make/)
- [nodejs](https://nodejs.org/en/) (<=12.x.x)
- [yarn](https://classic.yarnpkg.com/en/docs/install/)
- [python](https://www.python.org/downloads/) (<=3.8)
- [pip3](https://pip.pypa.io/en/stable/installing/)

### Node Packages

- [puppeteer](https://www.npmjs.com/package/puppeteer)
- [pngjs](https://www.npmjs.com/package/pngjs)
- [pixelmatch](https://www.npmjs.com/package/pixelmatch)

### PyPi Packages

- [clickgen](https://pypi.org/project/clickgen)

## Build From Scratch

### Auto Build (using GitHub Actions)

GitHub Actions is automatically runs on every `push`(on **main** & **dev** branch) and `pull request`(on **main** branch), You found theme resources in `artifact` section of **bibata-ci**. GitHub **Actions** available inside [.github/workflows](https://github.com/ful1e5/Bibata_Cursor/tree/main/.github/workflows) directory.

### Manual Build

> Check **[Makefile](./Makefile)** for more targets.

```bash
make
```

#### Build Only `XCursor` theme

```bash
make unix
```

#### Customize `XCursor` size

```bash
make unix X_SIZES=22            # Only built '22px' pixel-size.
make unix X_SIZES=22 24 32      # Multiple sizes are provided with  ' '(Space)
```

#### Install `XCursor` theme

```bash
make install            # install as user
  # OR
sudo make install       # install as root
```

#### Build Only `Windows` theme

```bash
make windows
```

#### Customize `Windows Cursor` size

```bash
make windows WIN_SIZE=96            # Supports only one pixel-size
```

> Windows installations steps are same as [these](#windows).

# You may also like...

- [**Bibata Adapta**](https://gitlab.com/cscs/Bibata_AdaptaBreath_Cursors) - Bibata Based Cursor Made for AdaptaBreath and Manjaro.
- [**Bibata Extra**](https://github.com/ful1e5/Bibata_Extra_Cursor) - More Bibata!
- [**Bibata Rainbow**](https://github.com/ful1e5/Bibata_Cursor_Rainbow) - 'Semi-Animated' Bibata cursors with rainbow colors
- [**Bibata Zebra**](https://github.com/ful1e5/Bibata-Zebra-Cursor) - Bibata cursor with a semi-animated strip
- [**Bibata Bee**](https://github.com/ful1e5/Bibata-Bee-Cursor) - 'Semi-Animated' Bibata cursors with bee stripes
- [**Bibata Translucent**](https://github.com/Silicasandwhich/Bibata_Cursor_Translucent) - Bibata translucent is a translucent flavor of the Bibata.

# Bugs

Bugs should be reported [here](https://github.com/ful1e5/Bibata_Cursor/issues) on the Github issues page.

# Getting Help

You can create a **issue**, I will help you. 🙂

# Contributing

Check [CONTRIBUTING.md](CONTRIBUTING.md), any suggestions for features and contributions to the continuing code masterelopment can be made via the issue tracker or code contributions via a `Fork` & `Pull requests`.

# Credit

- [Adwaita](https://github.com/GNOME/adwaita-icon-theme)
- [Dmz](https://github.com/GalliumOS/dmz-cursor-theme)
- [Yaru](https://github.com/ubuntu/yaru)
- Emojis are taken from [here](https://emojipedia.org/)
- Wedge loading from [loading.io](https://loading.io/spinner/wedges/-pie-wedge-pizza-circle-round-rotate) with **Microsoft** colors
