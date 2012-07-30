# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit bzr python eutils distutils gnome2-utils

EBZR_REPO_URI="http://bazaar.launchpad.net/~and471/kazam/unstable/"

DESCRIPTION="A screencasting program created with design in mind"
HOMEPAGE="https://launchpad.net/kazam"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-vcs/bzr"

RDEPEND="dev-python/python-distutils-extra
	dev-python/pyxdg
	dev-python/librsvg-python
	dev-libs/keybinder
	dev-python/python-xlib
	dev-python/gdata
	dev-python/pycurl"

DEST="/usr/share/kazam"

src_unpack() {
        bzr_src_unpack
}

pkg_preinst() {
	gnome2_icon_savelist
}

src_install() {
	# Install binary
	dobin bin/${PN} || die "Installing binary failed."

	# Install python modules
	insinto $(python_get_sitedir)
	doins -r kazam || die "Installing python modules failed."
	
	# Install "data"
	insinto "${DEST}"
	doins -r data/{images,mockups,ui} || die "Installing data filed."

	# Install icons
	for res in 16x16 22x22 24x24 32x32 48x48 96x96 128x128 ; do
		insinto /usr/share/icons/hicolor/${res}/apps
		doins data/icons/${res}/apps/${PN}.png || die "Installing icons failed."
	done
	insinto /usr/share/icons/hicolor/22x22/status
	doins data/icons/22x22/status/* || die "Installing icons failed."
	doicon data/icons/48x48/apps/${PN}.png || die "Installing pixmap failed."

	# Install desktop entry
	make_desktop_entry kazam kazam /usr/share/pixmaps/${PN}.png AudioVideo || die "Installing desktop entry failed."
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

