# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="LiteRT CLI for model conversion, quantization, and benchmarking"
HOMEPAGE="https://github.com/google-ai-edge/LiteRT-CLI"
SRC_URI="https://github.com/google-ai-edge/LiteRT-CLI/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/LiteRT-CLI-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="asr convert lm quantize visualize"

RDEPEND="
	sci-ml/litert
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/immutabledict[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	')
	asr? (
		sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
		sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/librosa[${PYTHON_USEDEP}]
			dev-python/sounddevice[${PYTHON_USEDEP}]
		')
	)
	convert? (
		sci-ml/ai-edge-quantizer
		sci-ml/litert-torch
		sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
		sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
		sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
		')
	)
	lm? ( sci-ml/litert-lm )
	quantize? ( sci-ml/ai-edge-quantizer )
	visualize? ( sci-ml/ai-edge-model-explorer )
"

RESTRICT="test"

src_prepare() {
	rm -rf litert_cli.egg-info || die
	# setuptools >=61 uses find_namespace_packages which picks up examples/
	# and tools/ even without __init__.py; add explicit excludes.
	sed -i \
		's/packages = {find = {}}/packages = {find = {exclude = ["examples", "examples.*", "tools", "tools.*"]}}/' \
		pyproject.toml || die
	distutils-r1_src_prepare
}
