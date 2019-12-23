# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="Python bindings for GLFW"
HOMEPAGE="https://github.com/FlorianRhiem/pyGLFW"
SRC_URI="https://github.com/FlorianRhiem/pyGLFW/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/glfw
"
BDEPEND=""
