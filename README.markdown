mint-setup
==========

intro
-----
mint-setup is a collection of scripts designed to be run on a vanilla [Linux Mint](http://www.linuxmint.com/) installation.

They perform the following steps:

* upgrade all installed packages
* downgrade to GCC 4.5 (due to incompatibilities with certain Ruby tools)
* install [StumpWM](http://stumpwm.org/), a Lisp-based window manager
* install Google Chrome
* install Skype
* install Ruby and Rails-related libraries and tools
* install Bundler
* configure VICE with ROMs for common Commodore microcomputers
* install and configure Emacs for a variety of development tasks including RoR, Lisp and Inform

I've tested them on the following systems:

1. 64-bit Linux Mint 12 on a MacBook Pro
1. 32-bit Linux Mint 12 on an Asus EeePC R101 

usage
-----
Clone the mint-setup repo, cd into it, then:

    sudo ./mint-setup-root.sh
    ./mint-setup-user.sh

troubleshooting
---------------
* _vesamenu.c32 : not a COM32R image_  If you experience a failure to boot from a Linux Mint USB stick, DVD or CD with that error message, type 'live' and press ENTER.  See [here](http://forums.linuxmint.com/viewtopic.php?f=46&t=60436) for details.

roadmap
-------
1. test on a variety of 64- and 32-bit systems
1. upgrade from Bash to a more modern approach (Babushka?)

licence
-------
There are several Emacs packages inside conf which have their own particular licences.  The scripts unique to mint-setup are licensed under the GNU Lesser General Public License.

### why the LGPL?
The GPL is specifically designed to reduce the usefulness of GPL-licensed code to closed-source, proprietary software. The BSD license (and similar) don't mandate code-sharing if the BSD-licensed code is modified by licensees. The LGPL achieves the best of both worlds: an LGPL-licensed library can be incorporated within closed-source proprietary code, and yet those using an LGPL-licensed library are required to release source code to that library if they change it.


