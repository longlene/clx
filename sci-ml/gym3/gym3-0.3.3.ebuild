# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Vectorized interface for reinforcement learning environments"
HOMEPAGE="https://github.com/openai/gym3"
SRC_URI="https://github.com/openai/gym3/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/numpy-1.11.0${PYTHON_USEDEP}]
	>=dev-python/cffi-1.13.0${PYTHON_USEDEP}]
	>=dev-python/imageio-2.6.0${PYTHON_USEDEP}]
	>=dev-python/imageio-ffmpeg-0.3.0${PYTHON_USEDEP}]
	>=dev-python/glfw-1.8.6${PYTHON_USEDEP}]
	>=dev-python/moderngl-5.5.4${PYTHON_USEDEP}]
"
