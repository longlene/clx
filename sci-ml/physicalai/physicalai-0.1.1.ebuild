# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lightweight runtime for physical AI inference"
HOMEPAGE="https://github.com/openvinotoolkit/physicalai"
SRC_URI="https://github.com/openvinotoolkit/physicalai/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/jsonargparse[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/num2words[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pynokhwa[${PYTHON_USEDEP}]
	dev-python/pyturbojpeg[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	media-libs/opencv[python,${PYTHON_USEDEP}]
	dev-python/onnxruntime[${PYTHON_USEDEP}]
	>=sci-ml/openvino-2026.1
	sci-ml/openvino-tokenizers
	>=sci-ml/safetensors-0.4.3[${PYTHON_USEDEP}]
	>=sci-ml/transformers-5.3.0
"
