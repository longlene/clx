# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib python gnome2

MY_P="${PN}-1.0-RC2"
DESCRIPTION="Disk manager is a simple filesystem configurator"
HOMEPAGE="http://flomertens.free.fr/disk-manager/index.html"
SRC_URI="http://flomertens.free.fr/disk-manager/download/source/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="libnotify"

RDEPEND=">=sys-apps/hal-0.5.9-r1
	>=sys-fs/udev-60 
	>=dev-python/pygtk-2.10.4 
	>=dev-lang/python-2.4
	libnotify? ( dev-python/notify-python )"

DEPEND="${RDEPEND}
	dev-util/intltool"

S="${WORKDIR}/${MY_P}"

DOCS="AUTHORS COPYING INSTALL README TODO"

src_unpack() {
	gnome2_src_unpack
	cd "${S}"
	ln -fs /bin/true py-compile
}

pkg_postinst() {
	gnome2_pkg_postinst
	python_version
	python_mod_optimize	"${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/DiskManager"
}

pkg_postrm() {
	gnome2_pkg_postrm
	python_version
	python_mod_cleanup
}
