# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Inference engine for Qwen3.8-Flash-Next 125B MoE on 12-24 GB NVIDIA GPUs"
HOMEPAGE="
	https://github.com/Niko1221/Strata
"
SRC_URI="https://github.com/Niko1221/Strata/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Strata-${PV}"

# The project ships no license file (all rights reserved); the vendored
# ggml-common.h under third_party/ is MIT.
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"
# No license to mirror under; the ctest suite needs a real NVIDIA GPU and
# the published tree omits tests/ anyway.
RESTRICT="mirror test"

RDEPEND="
	>=sci-ml/ggml-0.24.0:=
	cuda? ( dev-util/nvidia-cuda-toolkit )
	dev-python/jinja2
	dev-python/numpy
	dev-python/regex
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	dev-build/ninja
	dev-python/cmake
"

inherit cmake

src_prepare() {
	cmake_src_prepare
	# The project ships no install rules; add them for the user-facing
	# binaries (this slim portage does not auto-apply files/*.patch).
	eapply "${FILESDIR}/${P}-cmake-install.patch"
	# Link the system sci-ml/ggml (ggml-cpu + ggml-base) instead of building
	# a private static copy from a pinned llama.cpp checkout.
	eapply "${FILESDIR}/${P}-system-ggml.patch"
}

src_configure() {
	local mycmakeargs=(
		-DSTRATA_ENABLE_CUDA=$(usex cuda)
		-DSTRATA_NATIVE_EXPERTS=ON
		-DSTRATA_USE_SYSTEM_GGML=ON
	)
	# Developed on sm_120 (RTX 50); the CMake arch guard accepts >= 80
	# (RTX 30/40/50 series).
	if use cuda; then
		mycmakeargs+=( -DCMAKE_CUDA_ARCHITECTURES="80;86;89;120" )
	fi
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# The model-prep tools, the API server and the chat client (Python);
	# the CMake project ships no install rules for them.
	insinto /usr/share/strata
	doins chat.py setup.py
	doins -r data tools serve
	dodoc README.md
	# docs/ (incl. the paper/ subdir); this slim portage has no
	# doinstalldocs, dodoc -r covers it.
	dodoc -r docs
}
