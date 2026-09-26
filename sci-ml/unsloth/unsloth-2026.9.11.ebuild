# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="2-5X faster training, reinforcement learning and finetuning"
HOMEPAGE="
	https://unsloth.ai/
	https://github.com/unslothai/unsloth
	https://pypi.org/project/unsloth/
"
# upstream stopped tagging releases on GitHub and publishes no sdist
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="studio"

# upstream caps torch <2.13, transformers <=5.5, trl <=0.24 and datasets <4.4;
# not enforced, only newer versions are available here
RDEPEND="
	>=sci-ml/unsloth-zoo-2026.9.7[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.4.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.51.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/trl-0.18.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.18.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-0.34.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-3.4.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.34.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/bitsandbytes-0.45.5[${PYTHON_SINGLE_USEDEP}]
	sci-ml/diffusers[${PYTHON_SINGLE_USEDEP}]
	amd64? ( >=sci-ml/xformers-0.0.27[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		>=dev-python/triton-3.0.0[${PYTHON_USEDEP}]
		>=sci-ml/sentencepiece-0.2.0[python(+),${PYTHON_USEDEP}]
		>=dev-python/wheel-0.42.0[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/tyro[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/hf-transfer[${PYTHON_USEDEP}]
		>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/nest-asyncio[${PYTHON_USEDEP}]
		>=dev-python/structlog-24.1.0[${PYTHON_USEDEP}]
		>=dev-python/click-8.0[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		studio? (
			>=dev-python/fastapi-0.141.1[${PYTHON_USEDEP}]
			>=dev-python/uvicorn-0.52.1[${PYTHON_USEDEP}]
			>=dev-python/pyjwt-2.13.0[${PYTHON_USEDEP}]
			>=dev-python/matplotlib-3.10.9[${PYTHON_USEDEP}]
			>=dev-python/pandas-2.3.3[${PYTHON_USEDEP}]
			>=dev-python/urllib3-2.3.0[${PYTHON_USEDEP}]
			>=dev-python/jinja2-3.1.0[${PYTHON_USEDEP}]
			>=dev-python/diceware-1.0.1[${PYTHON_USEDEP}]
			>=dev-python/ddgs-9.14.4[${PYTHON_USEDEP}]
			>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
			>=dev-python/boto3-1.34.0[${PYTHON_USEDEP}]
			>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
			>=dev-python/fastmcp-3.0.2[${PYTHON_USEDEP}]
		)
	')
"

src_unpack() {
	:
}

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${P}-py3-none-any.whl"
}
