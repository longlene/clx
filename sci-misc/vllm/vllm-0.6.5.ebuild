# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A high-throughput and memory-efficient inference and serving engine for LLMs"
HOMEPAGE="
	https://docs.vllm.ai/
	https://pypi.org/project/vllm/
"
SRC_URI="
	https://github.com/vllm-project/vllm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/pytorch-2.5.1[${PYTHON_SINGLE_USEDEP}]
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
