# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="An open-source RAG engine based on deep document understanding"
HOMEPAGE="
	https://pypi.org/project/deepdoc-lib/
	https://github.com/xorbitsai/deepdoc-lib
"
SRC_URI="https://github.com/xorbitsai/deepdoc-lib/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/datrie-0.8.2[${PYTHON_USEDEP}]
		>=dev-python/anthropic-0.69.0[${PYTHON_USEDEP}]
		>=dev-python/beartype-0.18.5[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.12.0[${PYTHON_USEDEP}]
		>=dev-python/chardet-5.2.0[${PYTHON_USEDEP}]
		>=dev-python/demjson3-3.0.6[${PYTHON_USEDEP}]
		>=dev-python/hanziconv-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.0[${PYTHON_USEDEP}]
		>=sci-ml/modelscope-1.20.0[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.6[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.1[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
		>=dev-python/ollama-0.6.1[${PYTHON_USEDEP}]
		>=dev-python/onnxruntime-1.19.2[${PYTHON_USEDEP}]
		>=dev-python/openai-1.45.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.10.0[python,${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/pdfplumber-0.10.4[${PYTHON_USEDEP}]
		>=dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyclipper-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/pypdf-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-pptx-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/python-docx-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/shapely-2.0.5[${PYTHON_USEDEP}]
		>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
		>=dev-python/strenum-0.4.15[${PYTHON_USEDEP}]
		>=dev-python/tencentcloud-sdk-python-3.0.1215[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/xgboost-1.6.0[${PYTHON_USEDEP}]
		>=dev-python/xpinyin-0.7.6[${PYTHON_USEDEP}]
		>=dev-python/zhipuai-2.0.1[${PYTHON_USEDEP}]
		>=dev-python/google-generativeai-0.8.1[${PYTHON_USEDEP}]
		>=dev-python/trio-0.29.0[${PYTHON_USEDEP}]
		>=dev-python/setuptools-75.2.0[${PYTHON_USEDEP}]
		>=sci-ml/huggingface_hub-0.25.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_install() {
	distutils-r1_python_install
	rm -r "${D}$(python_get_sitedir)"/{tests,scripts} || die
}
