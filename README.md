<a href="https://github.com/KaizIqbal/Bibata_Cursor">
  <p align="center"><img title="Bibata" src="https://github.com/KaizIqbal/Bibata_Cursor/blob/master/image/Bibata.png"></p>
</a>

[![HitCount](http://hits.dwyl.io/KaizIqbal/Bibata_Cursor.svg)](http://hits.dwyl.io/KaizIqbal/Bibata_Cursor)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![GitHub contributors](https://img.shields.io/github/contributors/KaizIqbal/Bibata_Cursor.svg)](https://GitHub.com/KaizIqbal/Bibata_Cursor/graphs/contributors/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/KaizIqbal/Bibata_Cursor/graphs/commit-activity)
![PRs](https://img.shields.io/badge/PRs-Welcome-red.svg)
[![Donate](https://img.shields.io/badge/Donate-yes-yellow.svg)](https://www.paypal.me/kaizkhatri)
[![Code Of Conduct](https://img.shields.io/badge/COC-yes-pink.svg)](https://github.com/KaizIqbal/Bibata_Cursor/blob/master/CODE_OF_CONDUCT.md)

![Open Source Love png1](https://badges.frapsoft.com/os/v1/open-source.png?v=103)
![Bash Shell](https://badges.frapsoft.com/bash/v1/bash.png?v=103)

[![GitHub forks](https://img.shields.io/github/forks/KaizIqbal/Bibata_Cursor.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/KaizIqbal/Bibata_Cursor/network)
[![GitHub watchers](https://img.shields.io/github/watchers/KaizIqbal/Bibata_Cursor.svg?style=social&label=Watch&maxAge=2592000)](https://GitHub.com/KaizIqbal/Bibata_Cursor/watchers/)
[![GitHub stars](https://img.shields.io/github/stars/KaizIqbal/Bibata_Cursor.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/KaizIqbal/Bibata_Cursor/stargazers/)
[![GitHub followers](https://img.shields.io/github/followers/KaizIqbal.svg?style=social&label=Follow&maxAge=2592000)](https://github.com/KaizIqbal?tab=followers)

<br />

## How to get Project Message and Updates

I'll release messages on
 * [Twitter](https://twitter.com/ful1e5_)



## Table Of Contents
<!--ts-->
   * [How to get Project Message and Updates](#how-to-get-project-message-and-updates)
   * [Table Of Contents](#table-of-contents)
   * [What is Bibata](#what-is-bibata)
   * [Dependencies](#dependencies)
      * [Build dependencies](#build-dependencies)
   * [Installation](#installation)
      * [Build From Source Code](#build-from-source-code)
      * [Package](#package)
         * [Archlinux](#archlinux)
         * [Fedora](#fedora)
   * [Quick Fixes](#quick-fixes)
      * [Inherits Problem](#inherits-problem)
   * [Gallery](#gallery)
   * [Bugs](#bugs)
   * [License & Terms](#license-and-terms)
   * [Getting help](#getting-help)
   * [Contributions & Suggestions](#contributions-and-suggestions)
   * [Looking For Another Bibata](#looking-for-another-bibata)
      * [Bibata Extra](#bibata-extra)
      * [Bibata Adapta](#bibata-adapta)
   * [Contributors](#contributors)
   * [Become Sponsor](#become-sponsor)
<!--te-->

**Who Am I?**

I'm a _ComputerScienceStudent_, _GraphicsDesigner_ and _OpenSourceEnthusiast_. I mostly do  _ComputerGraphics_ stuffs and love them 💕

Currently I'm making lots of Linux Themes to Improve [Linux](https://en.wikipedia.org/wiki/Linux) Experience, if you enjoy my works please consider making a donation. My ultimate goal is to become a full-time open-source ninja.

## What is Bibata

|      Name      |     Description     |
| :-----------:  | :------------------ |
|     Bibata     | Bibata is **OpenSource** ,Compact and Material Designed Cursor set.This project masterelop for improve ```Linux``` Experience and Feel _openness_ in ```OpenSoftwareWorld```.|
|   Bibata Oil   | Dark  Theme  |
|   Bibata ice   | Light Theme  |
|   Bibata Amber | Yellowish-Orange Theme |


## Dependencies

### Build dependencies

* [Xcursorgen](https://github.com/freedesktop/xcursorgen)
* [Inkscape](https://gitlab.com/inkscape/inkscape)
* [gnome-themes-standard](https://launchpad.net/ubuntu/+source/gnome-themes-standard)

## Installation

**Note :** Latest ```Stable``` & ```BETA``` releases can be downloaded from [Here](https://github.com/KaizIqbal/Bibata_Cursor/releases)

### Build From Source Code

1. Make sure you have installed all [Dependencies](#dependencies).

2. **Build & Install**:
    ```bash
    $git clone https://github.com/KaizIqbal/Bibata_Cursor.git
    $cd Bibata_Cursor/
    $chmod +x build.sh
    $./build.sh
    $chmod +x ./Installer_Bibata.sh
    ```
    Install (As ROOT User)
    ```bash
    $sudo ./Installer_Bibata.sh
    ```
    Install (As Local User)
    ```
    $./Installer_Bibata.sh
    ```
3. **Uninstall**:

     Using ```Script``` :

      ```bash
      #From ROOT
      $sudo ./Installer_Bibata.sh
      #From Local User
      $./Installer_Bibata.sh
      ```

     Without ```Script``` :
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
   Arch Linux users can install from the [AUR](https://aur.archlinux.org/packages/bibata-cursor-theme/) currently maintained by _@Shatur_.
   Arch Linux users can install the theme collection from the AUR repository by using the yaourt or packer commands below.

   **Yaourt commands:**
   ```
   yaourt -S bibata-cursor-theme

   ```
   **Packer commands:**
   ```
   packer -S bibata-cursor-theme

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

## Quick Fixes
##### *Inherits* Problem
issue [#8](https://github.com/KaizIqbal/Bibata_Cursor/issues/8)

edit ```/usr/share/icons/default/index.theme``` and replace your cursor.

     [Icon Theme]
     Inherits=Adwaita

edited to

     [Icon Theme]
     Inherits=Bibata_Ice                      #replace here

## Gallery

<p align="center"><img title="Bibata Ice" src="https://github.com/KaizIqbal/Bibata_Cursor/blob/master/image/Bibata_Ice.png">
</br><sub>Bibata Ice</sub></p>

<p align="center"><img title="Bibata Amber" src="https://github.com/KaizIqbal/Bibata_Cursor/blob/master/image/Bibata_Amber.png">
</br><sub>Bibata Amber</sub></p>

<p align="center"><img title="Bibata Oil" src="https://github.com/KaizIqbal/Bibata_Cursor/blob/master/image/Bibata_Oil.png">
</br><sub>Bibata Oil</sub></p>

## Bugs

Bugs should be reported [here](https://github.com/KaizIqbal/Bibata_Cursor/issues) on the Github issues page.


## License and Terms

```Bibata Cursor SET``` Collection is available under the terms of the GPL-3.0 license See [`LICENSE`](https://github.com/KaizIqbal/Bibata_Cursor/blob/master/LICENSE) for details.

## Getting help

You can create a issue, I will help you.

## Contributions and Suggestions

Any suggestions for features and contributions to the continuing code masterelopment can be made via the issue tracker or code contributions via a ```Fork``` & ```Pull requests```.

OR

You give suggestions on _slack_ @ [#bibata-cursor](https://kaizkhatri.slack.com/messages/CCK84QYQ4/)
###

## Looking For Another Bibata

###### Bibata Extra

Bibata Extra **</>** and maintained by @KaizIqbal you find it at [GitHub](https://github.com/KaizIqbal/Bibata_Extra_Cursor)

###### Bibata Adapta

Bibata Adapta **</>** and maintained by @cscs you find it at [Gitlab](https://gitlab.com/cscs/Bibata_AdaptaBreath_Cursors)

###### Bibata Translucent

Bibata Translucent **</>** and maintained by @Silicasandwhich you find it at [GitHub](https://github.com/Silicasandwhich/Bibata_Cursor_Translucent)

## Contributors
Thanks goes to these wonderful people

|                |                |                |                |            |                |                   
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: | :-------------: | 
| [<img src="https://avatars3.githubusercontent.com/u/6747270?s=400&v=4" width="100px;"/><br /><sub><b>mleyen</b><br /></sub>](https://github.com/mleyen) 👨‍💻| [<img src="https://avatars2.githubusercontent.com/u/14180792?s=400&v=4" width="100px;"/><br /><sub><b>eti0</b><br /></sub>](https://github.com/eti0) 👨‍💻| [<img src="https://avatars0.githubusercontent.com/u/6218030?s=400&v=4" width="100px;"/><br /><sub><b>mmetak<br /></b></sub>](https://github.com/mmetak) 👨‍💻| [<img src="https://avatars0.githubusercontent.com/u/11244308?s=400&v=4" width="100px;"/><br /><sub><b>alex285</b><br /></sub>](https://github.com/alex285)👨‍💻🐛 | [<img src="https://avatars0.githubusercontent.com/u/20587163?s=400&v=4" width="100px;"/><br /><sub><b>commonsourcecs</b><br /></sub>](https://github.com/commonsourcecs) 👨‍💻| [<img src="https://avatars0.githubusercontent.com/u/43558271?s=400&v=4" width="100px"/><br /><sub><b>SiicaSandwhich</b><br /></sub>](https://github.com/Silicasandwhich) 👨‍💻📦
| [<img src="https://avatars0.githubusercontent.com/u/20869381?s=400&v=4" width="100px"/><br /><sub><b>muhAlantabli</b><br /></sub>](https://github.com/muhAlantabli) 📦

## 💰 Support 💰
[Plings](https://www.pling.com/p/1197198/) by **pling**

### Become Sponsor
Give ♥️ to become sponsor of **Bibata**   

<p align="center"></br>
<a style="text-decoration: none;color:#009688;margin:0;padding:0 0 10px 0" href="https://github.com/KaizIqbal">
<span style="font-size:15px">Your Boy</span></br>
<span style="font-size:20px">Kaiz Khatri</span>
<h1 align="center">.^.</h1>
</p>
