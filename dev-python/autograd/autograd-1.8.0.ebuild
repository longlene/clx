# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )
inherit distutils-r1

DESCRIPTION="Efficiently computes derivatives of numpy code"
HOMEPAGE="https://github.com/HIPS/autograd"
SRC_URI="https://github.com/HIPS/autograd/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
"
