# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2:2.6"
GCONF_DEBUG=no

inherit autotools eutils gnome2 python

DESCRIPTION="a text editor that is simple, slim and sleek, yet powerful."
HOMEPAGE="http://scribes.sourceforge.net"

MY_P="${P}-dev-build${PR:1}"

SRC_URI="http://launchpad.net/scribes/${PV}/scribes-milestone1/+download/${MY_P}.tar.bz2"

S=${WORKDIR}/${MY_P}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="gnome-base/gconf
	doc? ( gnome-extra/yelp )
	dev-libs/dbus-glib
	dev-python/dbus-python
	dev-python/pygtk
	dev-python/gtkspell-python
	dev-python/pygtksourceview
	dev-python/pyxdg"
DEPEND="${RDEPEND}
	app-text/gnome-doc-utils
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

DOCS="AUTHORS ChangeLog CONTRIBUTORS NEWS README TODO TRANSLATORS"

pkg_setup() {
	python_set_active_version 2
	G2CONF="--disable-scrollkeeper"
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-sandbox.patch
	eautoreconf

	ln -nfs $(type -P true) py-compile || die
	python_convert_shebangs -r 2 .

	gnome2_src_prepare
}

src_install() {
	gnome2_src_install
	python_clean_installation_image
}

pkg_postinst() {
	gnome2_pkg_postinst
	python_mod_optimize SCRIBES
}

pkg_postrm() {
	gnome2_pkg_postrm
	python_mod_cleanup SCRIBES
}
