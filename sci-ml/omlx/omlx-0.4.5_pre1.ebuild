# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="0.4.5.dev1"

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..15} )

inherit distutils-r1

DESCRIPTION="LLM inference server with continuous batching and SSD caching"
HOMEPAGE="https://github.com/jundot/omlx"
SRC_URI="https://github.com/jundot/omlx/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/omlx-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="audio grammar mcp modelscope"
RESTRICT="test"

RDEPEND="
	sci-ml/mlx-lm[${PYTHON_SINGLE_USEDEP}]
	sci-ml/mlx-embeddings[${PYTHON_SINGLE_USEDEP}]
	sci-ml/mlx-vlm[${PYTHON_SINGLE_USEDEP}]
	sci-ml/dflash-mlx[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tokenizers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	audio? ( sci-ml/mlx-audio[${PYTHON_SINGLE_USEDEP}] )
	modelscope? ( sci-ml/modelscope[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		sci-ml/mlx[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/mistral-common[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/socksio[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/setproctitle[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/python-multipart[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/openai-harmony[${PYTHON_USEDEP}]
		dev-python/cohere-melody[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/markitdown[${PYTHON_USEDEP}]
		grammar? ( sci-ml/xgrammar[${PYTHON_USEDEP}] )
		mcp? ( dev-python/mcp[${PYTHON_USEDEP}] )
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		sci-ml/mlx[${PYTHON_USEDEP}]
	')
"
