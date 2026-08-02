# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit python-single-r1

COMMIT="72addda5cab94205635a98789f4a51f831a4a12c"

DESCRIPTION="FunASR-powered video transcription and LLM-assisted clipping"
HOMEPAGE="https://github.com/modelscope/FunClip"
SRC_URI="https://github.com/modelscope/FunClip/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/FunClip-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=sci-ml/funasr-1.1.2[${PYTHON_SINGLE_USEDEP}]
	sci-ml/modelscope[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-1.13[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/curl-cffi[${PYTHON_USEDEP}]
		dev-python/dashscope[${PYTHON_USEDEP}]
		dev-python/g4f[${PYTHON_USEDEP}]
		>=dev-python/gradio-4.31.3[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/moviepy[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-1.3.2[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		>=dev-python/twelvelabs-1.2.8[${PYTHON_USEDEP}]
	')
"

src_install() {
	insinto /usr/share/${PN}
	doins -r funclip font

	cat > "${T}/${PN}" <<-EOF || die
		#!/bin/sh
		cd /usr/share/${PN} || exit 1
		exec "${EPYTHON}" funclip/launch.py "\$@"
	EOF
	newbin "${T}/${PN}" "${PN}"
}
