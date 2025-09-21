# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=PyAV
MY_P=${MY_PN}-${PV}

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
inherit distutils-r1

DESCRIPTION="Pythonic bindings for FFmpeg's libraries"
HOMEPAGE="https://pyav.org"
SRC_URI="https://github.com/PyAV-Org/PyAV/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-video/ffmpeg"
RDEPEND=""
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/${MY_P}

