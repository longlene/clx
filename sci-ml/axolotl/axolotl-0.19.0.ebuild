# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Tool for fine-tuning and post-training large language models"
HOMEPAGE="
	https://axolotl.ai/
	https://github.com/axolotl-ai-cloud/axolotl
	https://pypi.org/project/axolotl/
"
SRC_URI="https://github.com/axolotl-ai-cloud/axolotl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="deepspeed flash-attn mlflow opentelemetry ray vllm"
# tests need GPUs and model downloads
RESTRICT="test"

# upstream pins exact versions; pins are relaxed to minimums, and the
# torch <=2.13 cap is not enforced as only newer versions are available here
RDEPEND="
	>=sci-ml/pytorch-2.11.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-1.17.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.20.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.23.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.16.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-1.13.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-4.8.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/trl-1.9.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/kernels-0.16.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/optimum-1.16.2[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/evaluate-0.4.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/lm-eval-0.4.11[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/bitsandbytes-0.50.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/liger-kernel-0.8.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/fla-core-0.5.2[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/flash-linear-attention-0.5.2[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/trackio-0.19.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/gradio-6.10.0[${PYTHON_SINGLE_USEDEP}]
	amd64? (
		>=sci-ml/xformers-0.0.33[${PYTHON_SINGLE_USEDEP}]
		>=sci-ml/torchao-0.17.0[${PYTHON_SINGLE_USEDEP}]
	)
	$(python_gen_cond_dep '
		>=dev-python/packaging-26.0[${PYTHON_USEDEP}]
		>=dev-python/hf-xet-1.4.3[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
		dev-python/hf-transfer[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
		>=dev-python/modal-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
		dev-python/addict[${PYTHON_USEDEP}]
		dev-python/fire[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/colorama[${PYTHON_USEDEP}]
		>=dev-python/numba-0.63.1[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.1[${PYTHON_USEDEP}]
		>=dev-python/typer-0.25.1[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		>=dev-python/nvidia-ml-py-12.560.30[${PYTHON_USEDEP}]
		dev-python/art[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/s3fs-2025.10.0[${PYTHON_USEDEP}]
		>=dev-python/gcsfs-2025.10.0[${PYTHON_USEDEP}]
		>=dev-python/adlfs-2026.2.0[${PYTHON_USEDEP}]
		>=dev-python/ocifs-1.3.2[${PYTHON_USEDEP}]
		>=dev-python/zstandard-0.22.0[${PYTHON_USEDEP}]
		sci-ml/fastcore[${PYTHON_USEDEP}]
		>=dev-python/langdetect-1.0.9[${PYTHON_USEDEP}]
		>=dev-python/immutabledict-4.2.0[${PYTHON_USEDEP}]
		>=dev-python/antlr4-python3-runtime-4.13.2[${PYTHON_USEDEP}]
		>=dev-python/schedulefree-1.4.1[${PYTHON_USEDEP}]
		>=dev-python/openenv-core-0.1.0[${PYTHON_USEDEP}]
		>=dev-python/axolotl-contribs-lgpl-0.0.7[${PYTHON_USEDEP}]
		>=dev-python/axolotl-contribs-mit-0.0.6[${PYTHON_USEDEP}]
		>=dev-python/posthog-6.7.11[${PYTHON_USEDEP}]
		>=dev-python/mistral-common-1.11.5[${PYTHON_USEDEP}]
		>=dev-python/triton-3.4.0[${PYTHON_USEDEP}]
		mlflow? ( dev-python/mlflow[${PYTHON_USEDEP}] )
		opentelemetry? (
			dev-python/opentelemetry-api[${PYTHON_USEDEP}]
			dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
			dev-python/opentelemetry-exporter-prometheus[${PYTHON_USEDEP}]
			dev-python/prometheus-client[${PYTHON_USEDEP}]
		)
		ray? ( >=dev-python/ray-2.52.1[${PYTHON_USEDEP}] )
	')
	deepspeed? ( >=sci-ml/deepspeed-0.18.6[${PYTHON_SINGLE_USEDEP}] )
	flash-attn? ( >=sci-ml/flash-attn-2.8.3[${PYTHON_SINGLE_USEDEP}] )
	vllm? ( >=sci-ml/vllm-0.17.0[${PYTHON_SINGLE_USEDEP}] )
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	# version is read from the VERSION file; setuptools-scm is only listed
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}
