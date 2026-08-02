# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Interactive HTML pretty-printer for ML research in IPython notebooks"
HOMEPAGE="https://github.com/google-deepmind/treescope"
SRC_URI="https://github.com/google-deepmind/treescope/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/numpy-1.25.2[${PYTHON_USEDEP}]
"
