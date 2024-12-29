
# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Model API: model wrappers and pipelines for inference with OpenVINO"
HOMEPAGE="
	https://github.com/openvinotoolkit/model_api/
"
SRC_URI="https://github.com/openvinotoolkit/model_api/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/openvino-2024.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/openvino-dev-2024.0[${PYTHON_SINGLE_USEDEP}]
	sci-libs/omz-tools[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.16.6[${PYTHON_USEDEP}]
		media-libs/opencv[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.5.4[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/model_api-${PV}/model_api/python/
