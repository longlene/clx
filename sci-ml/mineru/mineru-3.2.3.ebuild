# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Convert PDF, DOCX, PPTX and XLSX documents to Markdown and JSON"
HOMEPAGE="
	https://mineru.net/
	https://github.com/opendatalab/MinerU
"
SRC_URI="https://github.com/opendatalab/MinerU/archive/refs/tags/mineru-${PV}-released.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/MinerU-mineru-${PV}-released"

LICENSE="MinerU-Open-Source-License"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pipeline s3 vlm"
RESTRICT="test"

RDEPEND="
	sci-ml/huggingface_hub
	sci-ml/modelscope
	pipeline? (
		sci-ml/pytorch
		sci-ml/transformers
		sci-ml/torchvision
	)
	vlm? (
		sci-ml/pytorch
		sci-ml/transformers
		sci-ml/accelerate
	)
	$(python_gen_cond_dep '
		>=dev-python/click-8.1.7[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.2[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.21.6[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.67.1[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		>=dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
		>=dev-python/pypdfium2-4.30.0[${PYTHON_USEDEP}]
		>=dev-python/pypdf-5.6.0[${PYTHON_USEDEP}]
		dev-python/reportlab[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.46.2[${PYTHON_USEDEP}]
		media-libs/opencv[python,${PYTHON_USEDEP}]
		>=dev-python/fast-langdetect-0.2.3[${PYTHON_USEDEP}]
		>=dev-python/openai-1.70.0[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.13.5[${PYTHON_USEDEP}]
		>=dev-python/magika-0.6.2[${PYTHON_USEDEP}]
		dev-python/python-docx[${PYTHON_USEDEP}]
		dev-python/mammoth[${PYTHON_USEDEP}]
		>=dev-python/pylatexenc-2.10[${PYTHON_USEDEP}]
		>=dev-python/lxml-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/python-multipart[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		pipeline? (
			>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
			>=dev-python/ftfy-6.3.1[${PYTHON_USEDEP}]
			>=dev-python/shapely-2.0.7[${PYTHON_USEDEP}]
			>=dev-python/pyclipper-1.3.0[${PYTHON_USEDEP}]
			dev-python/onnxruntime[${PYTHON_USEDEP}]
		)
		s3? (
			>=dev-python/boto3-1.28.43[${PYTHON_USEDEP}]
		)
	')
"
BDEPEND="$(python_gen_cond_dep '
	>=dev-python/setuptools-77.0.3[${PYTHON_USEDEP}]
')"
