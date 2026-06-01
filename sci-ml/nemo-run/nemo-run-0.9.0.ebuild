# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A tool to configure, launch and manage your machine learning experiments"
HOMEPAGE="
	https://github.com/NVIDIA-NeMo/Run
"
SRC_URI="https://github.com/NVIDIA-NeMo/Run/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/Run-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/leptonai-0.26.6[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/inquirerpy-0.3.4[${PYTHON_USEDEP}]
		>=dev-python/catalogue-2.0.10[${PYTHON_USEDEP}]
		>=dev-python/fabric-3.2.2[${PYTHON_USEDEP}]
		>=dev-python/fiddle-0.3.0[${PYTHON_USEDEP}]
		>=sci-ml/torchx-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.12.3[${PYTHON_USEDEP}]
		>=dev-python/rich-13.7.1[${PYTHON_USEDEP}]
		>=dev-python/jinja22-3.1.4[${PYTHON_USEDEP}]
		>=dev-python/networkx-3.3[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		dev-python/toml[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
