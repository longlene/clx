# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Launch and manage Docker-based inference workloads on NVIDIA DGX Spark"
HOMEPAGE="https://github.com/spark-arena/sparkrun"
SRC_URI="https://github.com/spark-arena/sparkrun/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/click-8.3.3[${PYTHON_USEDEP}]
	>=dev-python/idna-3.15[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/scitrera-app-framework-0.0.69[${PYTHON_USEDEP}]
	>=dev-python/six-1.17.0[${PYTHON_USEDEP}]
	>=dev-python/textual-8.2.5[${PYTHON_USEDEP}]
	>=dev-python/vpd-0.9.13[${PYTHON_USEDEP}]
	>=sci-ml/huggingface_hub-1.8.0
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}
