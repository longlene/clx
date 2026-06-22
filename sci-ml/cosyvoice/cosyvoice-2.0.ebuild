# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit python-single-r1

DESCRIPTION="Multi-lingual large voice generation model with full-stack TTS ability"
HOMEPAGE="https://funaudiollm.github.io/cosyvoice3 https://github.com/FunAudioLLM/CosyVoice"
SRC_URI="https://github.com/FunAudioLLM/CosyVoice/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/CosyVoice-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sci-ml/diffusers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/lightning[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	dev-python/gradio[${PYTHON_SINGLE_USEDEP}]
	sci-ml/conformer[${PYTHON_SINGLE_USEDEP}]
	sci-ml/deepspeed[${PYTHON_SINGLE_USEDEP}]
	sci-ml/openai-whisper[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/grpcio[${PYTHON_USEDEP}]
		dev-python/grpcio-tools[${PYTHON_USEDEP}]
		dev-python/hyperpyyaml[${PYTHON_USEDEP}]
		dev-python/inflect[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/networkx[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pyworld[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/wget[${PYTHON_USEDEP}]
		net-misc/gdown[${PYTHON_USEDEP}]
		dev-python/hydra-core[${PYTHON_USEDEP}]
		sci-ml/modelscope[${PYTHON_USEDEP}]
		sci-ml/onnx[${PYTHON_USEDEP}]
		sci-ml/wetext[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS}"

RESTRICT="test"

src_install() {
	python_moduleinto cosyvoice
	python_domodule cosyvoice/.

	insinto /usr/share/${PN}
	doins -r runtime tools examples third_party
	doins webui.py vllm_example.py

	einstalldocs
}
