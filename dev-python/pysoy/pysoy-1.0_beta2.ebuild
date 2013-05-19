# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyreverse/pyreverse-0.5.1.ebuild,v 1.3 2007/07/11 06:19:47 mr_bones_ Exp $

inherit distutils

MY_P=${P/_/-}

DESCRIPTION="High-level 3D game engine for Python"
SRC_URI="http://www.pysoy.org/releases/${MY_P}.tar.bz2"
HOMEPAGE="http://www.pysoy.org/"

SLOT="0"
IUSE="examples gimp"
KEYWORDS="~amd64 ~ia64 ~x86"
LICENSE="GPL-3"
DEPEND=">=dev-lang/python-2.3
	>=virtual/opengl-7.0
	>=media-libs/glew-1.4.0
	>=dev-games/ode-0.8
	>=dev-libs/glib-2.12.0
	>=x11-libs/cairo-1.4.0
	>=media-libs/libogg-1.1.3
	>=media-libs/libtheora-1.0_alpha7
	gimp? ( >=media-gfx/gimp-2.4 )"
RDEPEND="${DEPEND}"
S=${WORKDIR}/${MY_P}
src_install() {
	distutils_src_install
	if use examples; then
		insinto /usr/share/${PN}/examples
		doins examples/*
		insinto /usr/share/${PN}/examples/media
		doins examples/media/*
	fi
	if use gimp; then
		insinto /usr/lib/gimp/2.0/plug-ins/
		doins plugins/gimp/soy-save.py
	fi
}
