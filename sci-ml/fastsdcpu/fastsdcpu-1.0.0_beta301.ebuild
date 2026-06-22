# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit python-single-r1

DESCRIPTION="Fast stable diffusion on CPU and AI PC"
HOMEPAGE="https://github.com/rupeshs/fastsdcpu"

MY_TAG="v$(ver_cut 1-3)-beta.${PV#*_beta}"
SRC_URI="https://github.com/rupeshs/fastsdcpu/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${MY_TAG#v}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gui mcp webui"
RESTRICT="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/diffusers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/openvino[${PYTHON_SINGLE_USEDEP}]
	sci-ml/optimum-intel[${PYTHON_SINGLE_USEDEP}]
	sci-ml/peft[${PYTHON_SINGLE_USEDEP}]
	sci-ml/mediapipe-bin[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tomesd[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		media-libs/opencv[python,${PYTHON_USEDEP}]
		sci-ml/controlnet-aux[${PYTHON_USEDEP}]
		sci-ml/onnx[${PYTHON_USEDEP}]
		dev-python/onnxruntime[${PYTHON_USEDEP}]
	')
	gui? (
		$(python_gen_cond_dep 'dev-python/pyqt5[${PYTHON_USEDEP}]')
	)
	mcp? (
		$(python_gen_cond_dep '
			dev-python/fastapi-mcp[${PYTHON_USEDEP}]
			dev-python/mcp[${PYTHON_USEDEP}]
		')
	)
	webui? (
		$(python_gen_cond_dep 'dev-python/gradio[${PYTHON_USEDEP}]')
	)
"

src_prepare() {
	eapply "${FILESDIR}"/${P}-xdg-paths.patch
	eapply_user
}

src_install() {
	insinto /usr/lib/${PN}/src
	doins -r src/.

	insinto /usr/share/${PN}
	doins -r configs

	exeinto /usr/bin
	newexe - "${PN}" <<-EOF
		#!/bin/bash
		PYTHONPATH=/usr/lib/${PN}/src exec ${PYTHON} /usr/lib/${PN}/src/app.py "\$@"
	EOF
}
