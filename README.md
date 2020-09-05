<!-- Branding -->

<p align="center">
  <img src="https://imgur.com/B5PjTsr.png" width="150">
  <br />
  <img src="https://imgur.com/g60k2RA.png" width="150">
</p>

<p align="center">
  🚀 Material Based Cursor 🏳️‍🌈
</p>

<!-- Badges -->

<p align="center">

  <!-- First Row -->
  <img alt="Travis CI" src="https://travis-ci.org/KaizIqbal/Bibata_Cursor.svg?branch=master">
  
  <a href="https://github.com/ful1e5/Bibata_Cursor/blob/master/LICENSE" >
    <img alt="License" src="https://img.shields.io/github/license/ful1e5/Bibata_Cursor?color=0081FB" />
  </a>

  <a href="https://github.com/KaizIqbal/Bibata_Cursor/releases" >
    <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/KaizIqbal/Bibata_Cursor">
  </a>
  
  <a href="https://aur.archlinux.org/packages/bibata-cursor-theme" >
    <img alt="AUR version" src="https://img.shields.io/aur/version/bibata-cursor-theme">
  </a>
  
  <!-- Second Row -->
  <br />
  <a href="https://www.codefactor.io/repository/github/ful1e5/bibata_cursor">
    <img src="https://www.codefactor.io/repository/github/ful1e5/bibata_cursor/badge" alt="CodeFactor" />
  </a>
  
  <a href="https://github.com/ful1e5">
    <img alt="Made By Kaiz"  src="https://kaiz.vercel.app/api/badge" width="133" />
  </a>
</p>

---

<!-- Table Of Content -->

<details>
 <summary><strong>Table of Contents</strong> (click to expand)</summary>

- [Bibata Cursor](#bibata-?)
  - [Cursor Sizes](#cursor-sizes)
  - [Colors](#colors)
  - [Quick Install For Linux](#quick-install)
  - [ArchLinux/Manjaro Package](#arch-linux/manjaro)
  - [Fedora Package](#fedora)
  - [Manual Install](#manual-install)
    - [Linux Install](#linux/x11)
    - [Windows Install](#windows)
  - [Cursors Preview](#preview)
- [Dependencies](#dependencies)
  - [Runtime Dependencies](#runtime-dependencies)
  - [Build Dependencies](#build-dependencies)
- [Build From Scrach](#build-from-scratch)
  - [⚡ Auto Build (using GitHub Actions)](#⚡-auto-build-using-gitHub-actions)
  - [Manual build](#manual-build)
    - [Setup Python Environment](#setup-python-environment)
    - [Compile Theme](#compile-from-source)
  - [Install Build Theme](#install-build-theme)
- [Bugs](#bugs)
- [Getting Help](#getting-help)
- [Contributors](./CONTRIBUTING.md#contributors)
- [Support ✨](#support)

</details>

<!-- Bibata intro -->

## Bibata ?

Bibata is **OpenSource**, Compact and Material Designed Cursor set. This project masterelop for improve `Cursor` Experience.

- **Bibata Amber :** Yellowish Theme.
- **Bibata Classic :** Solid Black Theme.
- **Bibata Ice :** Light Theme.

#### Bibata Styles

- **Bibata Original :** Sharp edge Bibata Cursors
- **Bibata Modern :** Round edge Bibata Cursors

#### Cursor Sizes

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

#### Colors

![Amber](https://imgur.com/5Jo6MSO.png)
![Classic](https://imgur.com/I5cRKE4.png)
![Ice ✓](https://imgur.com/avnR40g.png)

#### Quick install

##### via curl

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"
```

##### via wget

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"
```

### Packages 📦

> **📝Note**: If you're having trouble with the packages please submit a request to the package maintainer before creating an issue.

#### Arch Linux/Manjaro

Arch Linux/Manjaro users can install from the [AUR](https://aur.archlinux.org/packages/bibata-cursor-theme) currently maintained by [_@Shatur_](https://aur.archlinux.org/packages/?K=Shatur&SeB=m). Can be installed via Pamac (preinstalled in Manjaro), Yay or any other [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers).

Pamac command:

```bash
pamac install bibata-cursor-theme
```

Yay command:

```bash
yay -S bibata-cursor-theme
```

#### Fedora

Fedora users can install from the [copr-repo](https://copr.fedorainfracloud.org/coprs/muhalantabli/copr-repo) currently maintained by _@muhalantabli_.

Enable the repo:

```bash
sudo dnf copr enable muhalantabli/copr-repo
```

Installation command:

```bash
sudo dnf install bibata-cursor-theme
```

### Manual Install

#### Linux/X11

```bash
# extract `Bibata.tar.gz`
tar -xvf Bibata.tar.gz

# For local users
mv Bibata_* ~/.icons/

# For all users
sudo mv Bibata_* /usr/share/icons/
```

#### Windows

1. unzip `Bibata_Windows.zip` file
2. Open `Bibata_Windows/<Bibata_flavor>` in Explorer, and **right click** on `install.inf`.
3. Click 'Install' from the context menu, and authorise the modifications to your system.
4. Open _Control Panel_ > _Personalisation and Appearance_ > _Change mouse pointers_, and select **Bibata Cursors**.
5. Click '**Apply**'.

<!-- Preview -->

## Preview

<p align="center">
  <img title="Bibata Amber" width="90%" src="https://imgur.com/p60SQOq.png">
  </br>
  <sub>Bibata Amber</sub>
</p>

<p align="center">
  <img title="Bibata Classic" width="90%" src="https://imgur.com/WaqGcUF.png">
  </br>
  <sub>Bibata Classic</sub>
</p>

<p align="center">
  <img title="Bibata Ice" width="90%" src="https://imgur.com/ON1sd4H.png">
  </br>
  <sub>Bibata Ice</sub>
</p>

<!-- Build Dependencies -->

# Dependencies

## Runtime Dependencies

- libxcursor-dev
- libx11-dev
- libpng-dev (<=1.6)

#### Install Runtime Dependencies

##### macOS

```bash
brew cask install xquartz libpng
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
sudo dnf install libx11-devel libxcursor-devel libpng-devel
```

## Build Dependencies

- [nodejs](https://nodejs.org/en/) (<=12.x.x)
- [yarn](https://classic.yarnpkg.com/en/docs/install/)
- [python3](https://www.python.org/downloads/)
- [pip3](https://pip.pypa.io/en/stable/installing/)

### Node Packages

- [puppeteer](https://www.npmjs.com/package/puppeteer)
- [pngjs](https://www.npmjs.com/package/pngjs)
- [pixelmatch](https://www.npmjs.com/package/pixelmatch)
- [ora](https://www.npmjs.com/package/ora)
- [chalk](https://www.npmjs.com/package/chalk)

### PyPi Packages

- [clickgen](https://pypi.org/project/clickgen/)

## Build From Scratch

### ⚡ Auto Build (using GitHub Actions)

GitHub Actions is automatically runs on every `push`(on **master** and **dev** branches) and `pull request`(on **master** branch), You found theme resources in `artifact` section of **build**.GitHub **Actions** available inside [.github/workflows](https://github.com/ful1e5/Bibata_Cursor/tree/master/.github/workflows) directory.

### Manual Build

#### Setup python environment

```bash
python3 -m pip install --upgrade pip                 # Update pip to latest
python3 -m pip3 install virtualenv                   # Install python virtual environment
virtualenv venv                                      # Create new virtualenv named `venv`
source venv/bin/activate                             # Activate virtualenv

# For Deactivate virtualenv
deactivate
```

#### Compile From Source

> Make sure your [python environment](#setup-python-environment) setup and `virtualenv` is **active**.

```bash
yarn install                                         # Install all Node Packages
yarn py_install                                      # Install all PyPi Packages
yarn render                                          # Render all Bibata Bitmaps
yarn build                                           # Build all Windows & Linux packages
```

After build `bitmaps` and `themes` directory are generated at project **root**.

### Install Build Theme

All builded cursor themes are available inside `themes` directory.

#### Linux

```bash
cd ./themes

# installing Theme to local user(recommend)
rm -rf ~/.icons/Bibata_* && cp -r Bibata_* ~/.icons/
```

#### Windows

1. Open the `settings` app.
2. **Goto** `Devices` -> `Mouse` -> `Additional Mouse Options`.
3. **Goto** the `pointers` tab.
4. Replace each cursor in the currently applied cursor set with the corresponding cursor in the `./themes/<Bibata_flavor>` folder.
5. Click "**save as**" and type in the desired name.
6. Click "**apply**" and "**ok**".

<!-- Other Intersting projects -->

## You may also like...

- [**Bibata Extra**](https://github.com/KaizIqbal/Bibata_Extra_Cursor) - More Bibata!
- [**Bibata Adapta**](https://gitlab.com/cscs/Bibata_AdaptaBreath_Cursors) - Bibata Based Cursor Made for AdaptaBreath and Manjaro.
- [**Bibata Translucent**](https://github.com/Silicasandwhich/Bibata_Cursor_Translucent) - Bibata translucent is a translucent flavor of the Bibata.

<!-- Bug Report -->

# Bugs

Bugs 🐛 should be reported [here](https://github.com/ful1e5/apple_cursor/issues) on the Github issues page.

<!-- Help -->

# Getting Help

You can create a **issue**, I will help you. 🙂

<!-- Contributions and Suggestion -->

# Contributing

Check [CONTRIBUTING.md](CONTRIBUTING.md), any suggestions for features and contributions to the continuing code masterelopment can be made via the issue tracker or code contributions via a `Fork` & `Pull requests`.

<!-- This project isn't possible without these 👇🏻-->

## Credit

- [Adwaita](https://github.com/GNOME/adwaita-icon-theme)
- [Dmz](https://github.com/GalliumOS/dmz-cursor-theme)
- [Yaru](https://github.com/ubuntu/yaru)
- Emojis are taken from [here](https://emojipedia.org/)

<!-- Support -->

## Support

Share your joy with **★**.

> For more support

<a href="https://www.buymeacoffee.com/Nt7Wg4V" >
  <img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" >
</a>

<!-- Ninja  -->

<p align="center">
  <h1 align="center">(◣_◢)</h1>
</p>
<p align="center">
  <sub>Don't <strong>scroll</strong>, You <strong>wakes</strong> me up</sub>
</p>
