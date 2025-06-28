# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Neural Network Compression Framework"
HOMEPAGE="
	https://github.com/openvinotoolkit/nncf
"
SRC_URI="https://github.com/openvinotoolkit/nncf/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/openvino-telemetry-2023.2.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/jsonschema-3.2.0[${PYTHON_USEDEP}]
		>=dev-python/jstyleson-0.0.2[${PYTHON_USEDEP}]
		>=dev-python/natsort-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/networkx-2.6[${PYTHON_USEDEP}]
		>=dev-python/ninja-1.10.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.19.1[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.1.5[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/pydot-1.4.1[${PYTHON_USEDEP}]
		>=sci-ml/pymoo-0.6.0.1[${PYTHON_USEDEP}]
		>=dev-python/rich-13.5.2[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.3.2[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.54.1[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.1[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
