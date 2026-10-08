# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Run a 125B-parameter MoE model on a 12 GB+ NVIDIA or AMD GPU"
HOMEPAGE="
	https://github.com/Niko1221/Strata
"
# ggml is pinned to a llama.cpp commit (third_party/ggml/VERSION.txt);
# upstream FetchContent-clones it, we take the same snapshot offline.
SRC_URI="
	https://github.com/Niko1221/Strata/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ggml-org/llama.cpp/archive/3cf03257f219afbe7334045ff7c6a06ac68c627d.tar.gz
	-> llama.cpp-3cf03257.tar.gz
"

S="${WORKDIR}/Strata-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"
# The ctest suite needs a real GPU (parity oracles, VRAM); the CUDA targets
# also build internal parity/bench executables that need the toolkit.
RESTRICT="test"

RDEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	dev-python/jinja2
	dev-python/jsonschema
	dev-python/numpy
	dev-python/pillow
	dev-python/psutil
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

src_unpack() {
	default
	# The commit archive extracts to llama.cpp-<full-sha>/.
	mv "${WORKDIR}/llama.cpp-3cf03257f219afbe7334045ff7c6a06ac68c627d" \
		"${WORKDIR}/llama.cpp-3cf03257" || die
}

src_prepare() {
	cmake_src_prepare
	# The project ships no install rules; add them for the user-facing
	# binaries (this slim portage does not auto-apply files/*.patch).
	eapply "${FILESDIR}/${P}-cmake-install.patch"
}

src_configure() {
	local mycmakeargs=(
		-DSTRATA_ENABLE_CUDA=$(usex cuda)
		-DSTRATA_NATIVE_EXPERTS=ON
		# Take ggml (CPU native experts + the ggml-cuda MMQ sources) from the
		# pinned llama.cpp commit instead of a build-time git clone.
		-DSTRATA_GGML_DIR="${WORKDIR}/llama.cpp-3cf03257"
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
