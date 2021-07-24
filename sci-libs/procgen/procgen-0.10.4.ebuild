# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="Procedurally-Generated Game-Like Gym-Environments"
HOMEPAGE="https://github.com/openai/procgen"
SRC_URI="https://github.com/openai/procgen/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/numpy-1.17.0
	>=sci-libs/gym-0.15.0
	>=sci-libs/gym3-0.3.3
	>=dev-python/filelock-3.0.0
"
BDEPEND=""
