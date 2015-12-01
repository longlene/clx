# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base eutils gnome2 cmake-utils

DESCRIPTION="LaTeXila is an Integrated LaTeX Environment for the GNOME desktop,
written in Vala."
HOMEPAGE="http://latexila.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/latexila/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	${RDEPEND}
	>=dev-lang/vala-0.10
"
RDEPEND="
	>=dev-libs/glib-2.26:2
	gnome-base/gsettings-desktop-schemas
	>=x11-libs/gtk+-2.16:2
	>=x11-libs/gtksourceview-2.10:2.0
	dev-libs/libunique
	>=dev-util/cmake-2.6.4
	sys-devel/gettext
	>=dev-libs/libgee-0.5.0
	"

src_prepare() {
	gnome2_src_prepare
	einfo "Fixing valac executable name"
	sed -e 's|valac|valac-0.10|' -i	cmake/vala/FindVala.cmake
}

#src_configure() {
#	cmake-utils_src_configure
#}

src_compile() {
	mycmakeargs="${mycmakeargs} -DCMAKE_INSTALL_GCONF_SCHEMA_DIR=/etc/gconf/schemas"
	cmake-utils_src_compile
}

src_install() {
	einfo "Skipping data/cmake-compile-schemas"
	echo "" > data/cmake-compile-schemas
	export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL="1"
	cmake-utils_src_install
	unset GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
}
