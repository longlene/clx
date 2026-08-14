# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake unpacker

MY_PV="$(ver_cut 1-2)"
MY_P="TensorRT-${MY_PV}"
_TRT_BINPKG_URL="https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/$(ver_cut 1-3)/tars"

DESCRIPTION="A platform for high-performance deep learning inference on NVIDIA hardware"
HOMEPAGE="
	https://developer.nvidia.com/tensorrt
	https://github.com/NVIDIA/TensorRT
"
SRC_URI="
	https://github.com/NVIDIA/TensorRT/archive/refs/tags/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz
	${_TRT_BINPKG_URL}/TensorRT-Enterprise-${PV}-Linux-x86_64-cuda-13.3-Release-external.tar.zst
"

S="${WORKDIR}/${MY_P}"
LICENSE="Apache-2.0 NVIDIA-CUDA"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cross-builder"
RESTRICT="mirror bindist"

BDEPEND="app-arch/zstd"
DEPEND="
	>=dev-util/nvidia-cuda-toolkit-13.1.0
	dev-libs/cudnn
"
RDEPEND="${DEPEND}"

# Prebuilt runtime libs from the NVIDIA binary tarball
QA_PREBUILT="
	usr/bin/trtexec
	usr/bin/tensorrt_player
	usr/lib64/libnvinfer.so.*
	usr/lib64/libnvinfer_dispatch.so.*
	usr/lib64/libnvinfer_lean.so.*
	usr/lib64/libnvonnxparser.so.*
	usr/lib64/libnvinfer_builder_resource_*.so.*
	usr/lib64/libtensorrt_shim.so
	usr/lib64/tensorrt/stubs/*.so
"
# cross-builder USE flag includes win_ variants
QA_PREBUILT+="
	usr/lib64/libnvinfer_builder_resource_win_*.so.*
"

src_unpack() {
	unpacker
}

src_configure() {
	local cuda_root="${CUDA_PATH:-/opt/cuda}"
	local mycmakeargs=(
		-DTRT_LIB_DIR="${WORKDIR}/TensorRT-${PV}/lib"
		-DCMAKE_CUDA_ARCHITECTURES="89;90;100;103;110;120;121"
		-DBUILD_PARSERS=OFF
		-DBUILD_SAMPLES=OFF
	)
	cmake_src_configure
}

src_install() {
	local binpkg="${WORKDIR}/TensorRT-${PV}"
	local libver="$(ver_cut 1-3)"  # 10.15.1
	local sover="$(ver_cut 1)"  # SONAME major, e.g. 11

	# Executables from binary tarball
	dobin "${binpkg}/bin/trtexec"
	dobin "${binpkg}/bin/tensorrt_player"

	# Headers (including impl/ subdirectory)
	insinto /usr/include
	doins -r "${binpkg}"/include/.

	# Prebuilt core runtime libraries
	local lib
	for lib in libnvinfer libnvinfer_dispatch libnvinfer_lean libnvonnxparser; do
		dolib.so "${binpkg}/lib/${lib}.so.${libver}"
		dosym "${lib}.so.${libver}" "/usr/lib64/${lib}.so.${sover}"
		dosym "${lib}.so.${sover}" "/usr/lib64/${lib}.so"
	done

	# Per-architecture builder resource libraries
	local arch
	for arch in ptx sm75 sm80 sm86 sm89 sm90 sm100 sm120; do
		local f="${binpkg}/lib/libnvinfer_builder_resource_${arch}.so.${libver}"
		[[ -f "${f}" ]] || continue
		dolib.so "${f}"
		dosym "libnvinfer_builder_resource_${arch}.so.${libver}" \
			"/usr/lib64/libnvinfer_builder_resource_${arch}.so.${sover}"
		dosym "libnvinfer_builder_resource_${arch}.so.${sover}" \
			"/usr/lib64/libnvinfer_builder_resource_${arch}.so"
	done

	# Windows cross-builder resource libraries (for generating engine files targeting Windows)
	if use cross-builder; then
		for arch in ptx sm75 sm80 sm86 sm89 sm90 sm100 sm120; do
			local wf="${binpkg}/lib/libnvinfer_builder_resource_win_${arch}.so.${libver}"
			[[ -f "${wf}" ]] || continue
			dolib.so "${wf}"
			dosym "libnvinfer_builder_resource_win_${arch}.so.${libver}" \
				"/usr/lib64/libnvinfer_builder_resource_win_${arch}.so.${sover}"
			dosym "libnvinfer_builder_resource_win_${arch}.so.${sover}" \
				"/usr/lib64/libnvinfer_builder_resource_win_${arch}.so"
		done
	fi

	# TensorRT runtime shim (no versioned symlinks)
	dolib.so "${binpkg}/lib/libtensorrt_shim.so"

	# cmake-built plugin libraries
	dolib.so "${BUILD_DIR}/libnvinfer_plugin.so.${libver}"
	dosym "libnvinfer_plugin.so.${libver}" "/usr/lib64/libnvinfer_plugin.so.${sover}"
	dosym "libnvinfer_plugin.so.${sover}" "/usr/lib64/libnvinfer_plugin.so"

	dolib.so "${BUILD_DIR}/libnvinfer_vc_plugin.so.${libver}"
	dosym "libnvinfer_vc_plugin.so.${libver}" "/usr/lib64/libnvinfer_vc_plugin.so.${sover}"
	dosym "libnvinfer_vc_plugin.so.${sover}" "/usr/lib64/libnvinfer_vc_plugin.so"

	# Link-time stub libraries (for building software that links against TensorRT)
	insinto /usr/lib64/tensorrt/stubs
	insopts -m0755
	doins "${binpkg}"/lib/stubs/libnv*.so
	insopts -m0644

	dodoc "${binpkg}"/doc/{README,Acknowledgements}.txt
}
