# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Intercept and inspect Coding Agent API traffic in a local trace viewer"
HOMEPAGE="https://github.com/liaohch3/claude-tap"
SRC_URI="https://github.com/liaohch3/claude-tap/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/backports-zstd[${PYTHON_USEDEP}]
	' python3_13)
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_src_prepare
}
