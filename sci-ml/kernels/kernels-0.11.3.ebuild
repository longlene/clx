# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Download compute kernels"
HOMEPAGE="
	https://huggingface.co/docs/kernels
	https://github.com/huggingface/kernels
"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	>=sci-ml/huggingface_hub-0.26.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest
