# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit distutils eutils

MY_P=${PN%-modules}-${PV}

DESCRIPTION="Modules for renpy"
HOMEPAGE="http://www.renpy.org"
SRC_URI="http://www.renpy.org/dl/${PV}/${MY_P}-source.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/glew
	media-libs/libpng
	media-libs/libsdl
	media-libs/freetype:2
	virtual/ffmpeg
	dev-libs/fribidi
	dev-python/pygame[X]
	sys-libs/zlib"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}/module"

src_compile() {
	export RENPY_DEPS_INSTALL="${ROOT}usr"
	distutils_src_compile
}

PYTHON_MODNAME="pysdlsound"
