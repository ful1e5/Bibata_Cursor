<h1 align="center">
  <img src="./image/Bibata.png" width="150">
  <br>
  Bibata Cursor
</h1>

<h4 align="center">🚀 Material Based Cursor 🏳️‍🌈</h4>

<p align="center">
<img alt="Downloads" src="https://img.shields.io/github/downloads/KaizIqbal/Bibata_Cursor/total">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/KaizIqbal/Bibata_Cursor">
<!-- <a href="#">
  <img alt="Chat" src="https://img.shields.io/badge/chat-on slack-yellow">
</a> -->
<img alt="GitHub" src="https://img.shields.io/github/license/KaizIqbal/Bibata_Cursor">
<br>
<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/KaizIqbal/Bibata_Cursor">
<img alt="GitHub issues" src="https://img.shields.io/github/issues/KaizIqbal/Bibata_Cursor">
<img alt="Issues & PR" src="https://img.shields.io/badge/Issues & PR-welcome-green">
<br>
<img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/KaizIqbal/Bibata_Cursor">
<a href="https://aur.archlinux.org/packages/bibata-cursor-theme" target="_blank">
  <img alt="AUR version" src="https://img.shields.io/aur/version/bibata-cursor-theme">
</a>
<a href="https://www.paypal.me/KaizKhatri" target="_blank">
  <img alt="Donate" src="https://img.shields.io/badge/$-donate-red">
</a>
</p>

<p align="center">
  <a href="#bibata-?">Bibata</a> •
  <a href="#installation">Install</a> •
  <a href="#preview">Preview</a> •
  <a href="./CONTRIBUTING.md#Contributors" target="_blank">Contributors</a> •
  <a href="#credit">Credit</a> •
  <a href="#💰-support-💰">Support</a> •
  <a href="https://github.com/KaizIqbal/Bibata_Cursor/blob/master/LICENSE">License</a>
</p>

## Bibata ?

Bibata is **OpenSource** ,Compact and Material Designed Cursor set.This project masterelop for improve `Cursor` Experience.

## Installation

Latest `Stable` & `BETA` releases can be downloaded from [Here](https://github.com/KaizIqbal/Bibata_Cursor/releases)

### Build dependencies

- [git](https://git-scm.com/)
- [python3](https://www.python.org/)
- [pip](https://pypi.org/project/pip/)
- [Inkscape](https://inkscape.org/)
- [Xcursorgen](https://www.x.org/releases/X11R7.7/doc/man/man1/xcursorgen.1.xhtml)

### Install dependencies

##### Debain/Ubuntu

```
sudo apt install git python3 python3-pip git inkscape xcursorgen
```

##### Fedora

```
sudo dnf install git python37 python3-pip git inkscape xcursorgen
```

##### ArchLinux/Manjaro

```
sudo pacman -S git python python-pip git inkscape xorg-xcursorgen
```

**Note**: Snap/Flatpak packages raise issue in build(e.g. inkscape).

### Build From Source Code

1. Make sure you have installed all [Build dependencies](#build-dependencies).

2. **Build & Install**:
   ```bash
   git clone https://github.com/KaizIqbal/Bibata_Cursor.git
   cd Bibata_Cursor/
   chmod +x build.sh
   ./build.sh
   chmod +x ./install.sh
   ```
   Install (As ROOT User)
   ```bash
   sudo ./install.sh
   ```
   Install (As Local User)
   ```
   ./install.sh
   ```
3. **Uninstall**:

   Using `Script` :

   ```bash
   #From ROOT
   sudo ./install.sh
   #From Local User
   ./install.sh
   ```

   Without `Script` :

   ```bash
   #From ROOT
   $sudo rm -r /usr/share/icons/Bibata_*
   #from Local User
   $rm -r ~/.icons/Bibata_*
   #Note : Your replace * with flavor Name to remove individual
   ```

   ### Packages

   **Package Note**: If you're having trouble with the packages please submit a request to the package maintainer before creating an issue.

   ### Archlinux

   Arch Linux users can install from the [AUR](https://aur.archlinux.org/packages/bibata-cursor-theme/) currently maintained by [_@Shatur_](https://aur.archlinux.org/packages/?K=Shatur&SeB=m).
   Arch Linux users can install the theme collection from the AUR repository by using the yaourt or packer commands below.

   **Yaourt commands:**

   ```
   yaourt -S bibata-cursor-theme

   ```

   **Packer commands:**

   ```
   packer -S bibata-cursor-theme

   ```

   ### Manjaro linux

   **Pamac commands:**

   ```
   pamac install bibata-cursor-theme

   ```

   ### Fedora

   Fedora users can install from the [copr-repo](https://copr.fedorainfracloud.org/coprs/muhalantabli/copr-repo/) currently maintained by _@muhalantabli_.

   **enable the repo:**

   ```
   sudo dnf copr enable muhalantabli/copr-repo

   ```

   **installation commands:**

   ```
   sudo dnf install bibata-cursor-theme

   ```

More information about script is found in [src](./src/README.md) directory.

## Preview

<p align="center"><img title="Bibata Classic" src="./image/Bibata_Classic.png">
</br><sub>Bibata Oil</sub></p>

<p align="center"><img title="Bibata Oil" src="./image/Bibata_Oil.png">
</br><sub>Bibata Oil</sub></p>

<p align="center"><img title="Bibata Ice" src="./image/Bibata_Ice.png">
</br><sub>Bibata Ice</sub></p>

<p align="center"><img title="Bibata Amber" src="./image/Bibata_Amber.png">
</br><sub>Bibata Amber</sub></p>

## You may also like...

- [**Bibata Extra**](https://github.com/KaizIqbal/Bibata_Extra_Cursor) - More Bibata!
- [**Bibata Adapta**](https://gitlab.com/cscs/Bibata_AdaptaBreath_Cursors) - Bibata Based Cursor Made for AdaptaBreath and Manjaro.
- [**Bibata Translucent**](https://github.com/Silicasandwhich/Bibata_Cursor_Translucent) - Bibata translucent is a translucent flavor of the Bibata.

## Bugs

Bugs should be reported [here](https://github.com/KaizIqbal/Bibata_Cursor/issues) on the Github issues page.

## Getting help

You can create a issue, I will help you.

## Contributions and Suggestions

<a href="https://github.com/KaizIqbal/Bibata_Cursor/graphs/contributors">
  <img alt="GitHub contributors" src="https://img.shields.io/github/contributors/KaizIqbal/Bibata_Cursor?style=social">
</a>

Check [CONTRIBUTING.md](./CONTRIBUTING.md),any suggestions for features and contributions to the continuing code masterelopment can be made via the issue tracker or code contributions via a `Fork` & `Pull requests`.

###

## Credit

- [Adwaita](https://github.com/GNOME/adwaita-icon-theme)
- [Dmz](https://github.com/GalliumOS/dmz-cursor-theme)
- [Yaru](https://github.com/ubuntu/yaru)
- Emojis are taken from [here](https://emojipedia.org/)

## 💰 Support 💰

<a href="https://www.pling.com/p/1197198/" target="_blank">
<img src="https://www.pling.com/images_sys/store_pling/pling-logo.png" alt="Pling" style="height: 41px !important;width: 100px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;">
</a>
<br><br>
<a href="https://www.buymeacoffee.com/Nt7Wg4V" target="_blank">
<img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" >
</a>

<p align="center">
  <h1 align="center">.^.</h1>
</p>
