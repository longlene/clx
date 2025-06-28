# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="ModelScope: bring the notion of Model-as-a-Service to life"
HOMEPAGE="
	https://www.modelscope.cn/
	https://github.com/modelscope/modelscope
"
SRC_URI="https://github.com/modelscope/modelscope/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.25[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.64.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	sed -e "s#get_version(),#'${PV}',#" \
		-i setup.py
	distutils-r1_src_prepare
}
