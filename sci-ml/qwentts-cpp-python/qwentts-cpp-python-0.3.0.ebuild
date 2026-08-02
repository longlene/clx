# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python ctypes bindings for the qwentts.cpp C ABI"
HOMEPAGE="https://github.com/andimarafioti/qwentts-cpp-python"
SRC_URI="https://github.com/andimarafioti/qwentts-cpp-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/qwentts-cpp
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"

PATCHES=( "${FILESDIR}/system-libqwen-search.patch" )

src_prepare() {
	distutils-r1_src_prepare
}
