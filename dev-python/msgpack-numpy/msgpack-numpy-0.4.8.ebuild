# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
inherit distutils-r1

DESCRIPTION="Numpy data serialization using msgpack"
HOMEPAGE="https://github.com/lebedov/msgpack-numpy"
SRC_URI="https://github.com/lebedov/msgpack-numpy/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
"
