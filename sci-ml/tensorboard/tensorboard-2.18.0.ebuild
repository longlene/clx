# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="TensorFlow's Visualization Toolkit "
HOMEPAGE="https://github.com/tensorflow/tensorboard"
SRC_URI="https://github.com/tensorflow/tensorboard/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/tensorboard-data-server-0.7.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/absl-py-0.4[${PYTHON_USEDEP}]
		>=dev-python/grpcio-1.48.2[${PYTHON_USEDEP}]
		>=dev-python/markdown-2.6.8[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.12.0[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/protobuf-3.19.6[${PYTHON_USEDEP}]
		>=dev-python/six-1.9[${PYTHON_USEDEP}]
		>=dev-python/werkzeug-1.0.1[${PYTHON_USEDEP}]
	')

"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"

src_prepare() {
	default
	mv tensorboard/pip_package/{setup.*,requirements.*,README.*} .
	distutils-r1_src_prepare
}
