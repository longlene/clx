# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Train, Evaluate, Optimize, Deploy Computer Vision Models via OpenVINO"
HOMEPAGE="https://github.com/openvinotoolkit/training_extensions"
SRC_URI="
	https://github.com/openvinotoolkit/training_extensions/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-libs/pytorch-2.5.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/lightning-2.4.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/pytorchcv-0.0.67[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/timm-1.0.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/openvino-2024.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/openvino-model-api-0.2.5[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/nncf-2.14.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/datumaro-1.10.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/anomalib-1.1.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-libs/onnx-1.17.0[${PYTHON_USEDEP}]
		>=sci-libs/onnxconverter-common-1.14.0[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
		>=dev-python/jsonargparse-4.30.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.1.1[${PYTHON_USEDEP}]
		>=dev-python/ftfy-6.3.1[${PYTHON_USEDEP}]
		>=dev-python/regex-2024.11.6[${PYTHON_USEDEP}]
		>=dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
		>=dev-python/rich-argparse-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/einops-0.8.0[${PYTHON_USEDEP}]
		>=sci-libs/decord-0.6.0[${PYTHON_USEDEP}]
		>=dev-python/typeguard-4.3[${PYTHON_USEDEP}]
		>=dev-python/numba-0.60.0[${PYTHON_USEDEP}]
	')
"
#	>=sci-libs/openvino-dev-2024.6[${PYTHON_SINGLE_USEDEP}]
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/training_extensions-${PV}
