# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Play and Record Sound with Python"
HOMEPAGE="https://github.com/spatialaudio/python-sounddevice"
SRC_URI="https://github.com/spatialaudio/python-sounddevice/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/portaudio"
RDEPEND=""
BDEPEND=""

S="${WORKDIR}"/${P}
