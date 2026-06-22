# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Official Python client to connect with ModelScope Hub"
HOMEPAGE="https://github.com/modelscope/modelscope_hub"
SRC_URI="https://github.com/modelscope/modelscope_hub/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/modelscope_hub-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/requests-2.28[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.64.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.9[${PYTHON_USEDEP}]
		>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
	')
"
