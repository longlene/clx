# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=yes
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Accelerate Transformer models on NVIDIA GPUs using FP8 and FP4 precision"
HOMEPAGE="https://docs.nvidia.com/deeplearning/transformer-engine/user-guide/index.html https://github.com/NVIDIA/TransformerEngine"
SRC_URI="https://github.com/NVIDIA/TransformerEngine/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/TransformerEngine-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="jax +pytorch"

REQUIRED_USE="|| ( jax pytorch )"
RESTRICT="test"

RDEPEND="
	>=dev-libs/cudnn-9:=
	sci-ml/cudnn-frontend:=
	dev-libs/cutlass:=
	$(python_gen_cond_dep '
		dev-python/importlib-metadata[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
	')
	jax? (
		>=dev-python/flax-0.7.1[${PYTHON_SINGLE_USEDEP}]
		dev-python/jax[${PYTHON_SINGLE_USEDEP}]
	)
	pytorch? (
		>=sci-ml/pytorch-2.1[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/einops[${PYTHON_USEDEP}]
			sci-ml/onnx[${PYTHON_USEDEP}]
		')
	)
"
DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-util/nvidia-cuda-toolkit-12.1
	dev-build/cmake
	dev-build/ninja
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	eapply "${FILESDIR}/system-deps.patch"
	eapply "${FILESDIR}/setup-syspath.patch"
	distutils-r1_src_prepare
}

python_compile() {
	local framework=""
	use pytorch && framework+="${framework:+,}pytorch"
	use jax && framework+="${framework:+,}jax"

	NVTE_FRAMEWORK="${framework}" \
	NVTE_SKIP_SUBMODULE_CHECKS_DURING_BUILD=1 \
		distutils-r1_python_compile
}
