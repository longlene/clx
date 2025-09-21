# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

DESCRIPTION="Data manipulation and transformation for audio signal processing"
HOMEPAGE="https://github.com/pytorch/audio"
SRC_URI="https://github.com/pytorch/audio/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"
#	media-video/ffmpeg
BDEPEND=""
RESTRICT="test"

S="${WORKDIR}"/audio-${PV}

export USE_FFMPEG=OFF
export BUILD_SOX=OFF
export TORIO_USE_FFMPEG=OFF
