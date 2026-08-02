# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit python-single-r1

DESCRIPTION="Full-stack codebase for training and evaluating speculative decoding"
HOMEPAGE="https://github.com/deepseek-ai/DeepSpec"
SRC_URI="https://github.com/deepseek-ai/DeepSpec/archive/0a03e19e1c57000d5d3d291fa57109944eba6b6a.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/DeepSpec-0a03e19e1c57000d5d3d291fa57109944eba6b6a"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="test"

RDEPEND="
	${PYTHON_DEPS}
	>=sci-ml/pytorch-2.9[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.10[${PYTHON_SINGLE_USEDEP}]
	dev-libs/safetensors[${PYTHON_SINGLE_USEDEP}]
	sci-ml/sentencepiece[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/triton[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		sci-ml/datasets[${PYTHON_USEDEP}]
		sci-ml/tensorboard[${PYTHON_USEDEP}]
	')
"

pkg_setup() {
	python_setup
}

src_install() {
	python_domodule deepspec

	local s
	for s in eval.py train.py; do
		sed -i "1i#!/usr/bin/env python" "${s}" || die
		python_newscript "${s}" "deepspec-${s%.py}"
	done

	insinto /usr/share/${PN}
	doins -r config/
}
