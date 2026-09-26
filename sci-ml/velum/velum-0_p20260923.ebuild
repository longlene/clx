# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake cuda

COMMIT="0ee2032e6b88abebf4b6946421f76afea1f7e4e3"
GGML_COMMIT="e91ded11bdcd78c42f9c8d3978ff6686eb4c1226"

DESCRIPTION="Native C++ CosyVoice3 text-to-speech pipeline on GGML"
HOMEPAGE="https://github.com/hardenedlinux/velum"
SRC_URI="
	https://github.com/hardenedlinux/velum/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ggml-org/ggml/archive/${GGML_COMMIT}.tar.gz
		-> ggml-${GGML_COMMIT}.gh.tar.gz
"
S="${WORKDIR}/velum-${COMMIT}"

# velum is GPL-3; the statically linked ggml is MIT
LICENSE="GPL-3 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"
# tests compare against PyTorch reference dumps
RESTRICT="test"

RDEPEND="
	dev-libs/icu:=
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
"
DEPEND="${RDEPEND}"

src_prepare() {
	rmdir third_party/ggml || die
	mv "${WORKDIR}"/ggml-${GGML_COMMIT} third_party/ggml || die

	# apply the ggml patches here instead of CMake's configure-time git apply
	pushd third_party/ggml >/dev/null || die
	eapply "${S}"/patches
	popd >/dev/null || die
	sed -i -e '/^file(GLOB VELUM_GGML_PATCHES/c\set(VELUM_GGML_PATCHES "")' \
		CMakeLists.txt || die

	cmake_src_prepare
	use cuda && cuda_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DVELUM_ENABLE_CUDA=$(usex cuda)
		-DGGML_NATIVE=OFF
		-DGGML_CCACHE=OFF
	)
	if use cuda; then
		addpredict /dev/nvidiactl
		# -arch=native cannot see a GPU inside the build sandbox
		local archs=${CUDAARCHS}
		if [[ -z ${archs} && -n ${TORCH_CUDA_ARCH_LIST} ]]; then
			archs=${TORCH_CUDA_ARCH_LIST//./}
			archs=${archs// /;}
		fi
		mycmakeargs+=( -DCMAKE_CUDA_ARCHITECTURES="${archs:-native}" )
	else
		mycmakeargs+=( -DCMAKE_DISABLE_FIND_PACKAGE_CUDAToolkit=ON )
	fi
	cmake_src_configure
}

src_compile() {
	cmake_src_compile velum
}

src_install() {
	dobin "${BUILD_DIR}"/velum
	einstalldocs
	dodoc -r docs

	# offline weight/tokenizer conversion (needs the PyTorch stack)
	insinto /usr/share/${PN}
	doins -r tools
}
