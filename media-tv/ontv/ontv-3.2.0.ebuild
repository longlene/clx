# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PYTHON_DEPEND="2:2.4:2.7 3:3.1:3.1"

inherit eutils gnome2 python

DESCRIPTION="A GNOME applet to monitor current and upcoming TV programs"
HOMEPAGE="http://live.gnome.org/OnTV/"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-python/gnome-python-2.16.0
	>=dev-python/gnome-python-extras-2.14.2
	>=dev-python/notify-python-0.1.1
	>=dev-python/pygobject-2.12.0
	>=dev-python/pygtk-2.10.0
	gnome-base/gnome-control-center
	gnome-base/gnome-panel
	media-tv/xmltv
	>=x11-libs/gtk+-2.10.0
	x11-libs/vte"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.33
	dev-util/pkgconfig"

DOCS="AUTHORS ChangeLog FAQ HACKING NEWS README THANKS TODO"

pkg_setup() {
	if ! built_with_use x11-libs/vte python ; then
		eerror "You must emerge x11-libs/vte with the python USE flag"
		die "ontv needs python support in x11-libs/vte"
	fi
}

src_unpack() {
	gnome2_src_unpack

	# disable pyc compiling
	mv py-compile py-compile.orig
	ln -s $(type -P true) py-compile
}

pkg_postinst() {
	gnome2_pkg_postinst
	#python_version
	python_mod_optimize /usr/$(get_libdir)/python$(python_get_version)/site-packages/ontv
}

pkg_postrm() {
	gnome2_pkg_postrm
	python_mod_cleanup /usr/$(get_libdir)/python*/site-packages/ontv
}

