# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="OpenVINO Explainable AI Toolkit"
HOMEPAGE="
	https://github.com/openvinotoolkit/openvino_xai
"
SRC_URI="https://github.com/openvinotoolkit/openvino_xai/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/openvino-dev-2024.4[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		media-libs/opencv[python,${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
	')
"
RESTRICT="test"

S="${WORKDIR}"/openvino_xai-${PV}
