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
- [Install](#install)
- [Windows](#windows)
- [Preview](#preview)
- [Contributors](CONTRIBUTING.md#contributors)
- [Credit](#credit)
- [Support](#support)
- [License](LICENSE)

</details>

<!-- Bibata intro -->

## Bibata ?

Bibata is **OpenSource**, Compact and Material Designed Cursor set. This project masterelop for improve `Cursor` Experience.

- **Bibata Amber :** Yellowish Theme.
- **Bibata Classic :** Solid Black Theme.
- **Bibata Ice :** Light Theme.

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

### Build dependencies

- [git](https://git-scm.com/)
- [python3](https://www.python.org/)
- [pip](https://pypi.org/project/pip/)/[python-pillow](https://www.archlinux.org/packages/community/x86_64/python-pillow/)
- [Inkscape](https://inkscape.org/)
- [Xcursorgen](https://www.x.org/releases/X11R7.7/doc/man/man1/xcursorgen.1.xhtml)

### Install dependencies

**📝Note**: Snap/Flatpak packages raise issue in build (e.g. inkscape).

##### Debian/Ubuntu

```bash
sudo apt install git python3 python3-pip inkscape x11-apps
```

##### Fedora

```bash
sudo dnf install git python37 python3-pip inkscape xcursorgen
```

##### Arch Linux/Manjaro

```bash
sudo pacman -S git python-pillow inkscape xorg-xcursorgen
```

## Install

Latest `Stable` & `Development` releases can be downloaded from [Here](https://github.com/KaizIqbal/Bibata_Cursor/releases)

### Packages📦

**📝Note**: If you're having trouble with the packages please submit a request to the package maintainer before creating an issue.

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

<!--
From https://github.com/Silicasandwhich/Bibata_Cursor_Translucent#windows -->

#### Windows

1. Get the lastest stable/dev-version Windows release from the [releases tab](https://github.com/KaizIqbal/Bibata_Cursor/releases) on the github page.
2. Open the settings app.
3. Go to Devices -> Mouse -> Additional Mouse Options.
4. Go to the pointers tab.
5. Replace each cursor in the currently applied cursor set with the corresponding cursor in the Windows folder of your desired flavor.
6. Click "save as" and type in the desired name.
7. Click "apply" and "ok".

### Manual Installation

Make sure you have installed all [Build dependencies](#build-dependencies).

#### Build & Install

```bash
git clone https://github.com/KaizIqbal/Bibata_Cursor.git
cd Bibata_Cursor/
chmod +x build.sh
./build.sh
chmod +x ./install.sh
```

#### Install

```bash
./install.sh                                         # For local user
sudo ./install.sh                                    # For all users
```

#### Uninstall

##### Using Script

```bash
sudo ./install.sh                                    # From All Users
./install.sh                                         # From Local User
```

##### Without Script

```bash
sudo rm -r /usr/share/icons/Bibata_*                 # From All Users
rm -r ~/.icons/Bibata_*                              # From Local User

```

> More information about script is found in [src](./src/README.md) directory.

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

Check [CONTRIBUTING.md](./CONTRIBUTING.md), any suggestions for features and contributions to the continuing code masterelopment can be made via the issue tracker or code contributions via a `Fork` & `Pull requests`.

## Credit

- [Adwaita](https://github.com/GNOME/adwaita-icon-theme)
- [Dmz](https://github.com/GalliumOS/dmz-cursor-theme)
- [Yaru](https://github.com/ubuntu/yaru)
- Emojis are taken from [here](https://emojipedia.org/)

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
