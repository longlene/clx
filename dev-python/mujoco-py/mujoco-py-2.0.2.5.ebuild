# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="a physics engine for detailed, efficient rigid body simulations with contacts"
HOMEPAGE="https://github.com/openai/mujoco-py"
SRC_URI="https://github.com/openai/mujoco-py/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/glfw-1.4.0
	dev-python/numpy
	>=dev-python/cython-0.27.2
	>=dev-python/imageio-2.1.2
	>=dev-python/cffi-1.10
	dev-python/fasteners
"
BDEPEND=""
