# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Flask/FastAPI-like interface for deploying models on Triton Inference Server"
HOMEPAGE="
	https://pypi.org/project/nvidia-pytriton/
	https://github.com/triton-inference-server/pytriton
"
SRC_URI="https://github.com/triton-inference-server/pytriton/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/pytriton-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	<dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.7[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-23.0[${PYTHON_USEDEP}]
	>=dev-python/sh-1.14[${PYTHON_USEDEP}]
	dev-python/tritonclient[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.64.3[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.11[${PYTHON_USEDEP}]
	>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-7.0.1[${PYTHON_USEDEP}]
"
BDEPEND="$(python_gen_cond_dep 'dev-python/setuptools-scm[${PYTHON_USEDEP}]')"

RESTRICT="test"

src_prepare() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_src_prepare
}
