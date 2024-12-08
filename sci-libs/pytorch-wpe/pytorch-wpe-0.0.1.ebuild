# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A pytorch implementation of Weighted Prediction Error"
HOMEPAGE="https://github.com/huggingface/tokenizers"
SRC_URI="
	https://github.com/nttcslab-sp/dnn_wpe/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest

S="${WORKDIR}"/dnn_wpe-${PV}
