# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
LLVM_COMPAT=( 23 )

inherit cmake llvm-r2 python-any-r1

DESCRIPTION="Fast usermode x86 and x86-64 emulator for Arm64 Linux"
HOMEPAGE="https://github.com/FEX-Emu/FEX"

# Upstream is developed with git submodules that are missing from the
# GitHub archive. Every submodule the build needs is fetched at the
# commit pinned by the FEX-2609.1 tag (9fbdc00bd6401aff3b32d79e78ff98b8a13e4dcf).
SHA_CPP_OPTPARSE="9f94388a339fcbb0bc95c17768eb786c85988f6e"
SHA_DRM_HEADERS="3e49836995c1dcb3df709440ad2f270b569c6a5f"
SHA_FMT="c07e2aa4b130b4fd359a1c6455a5201b17af01fa"
SHA_JEMALLOC="8436195ad5e1bc347d9b39743af3d29abee59f06"
SHA_RANGE_V3="ca1388fb9da8e69314dda222dc7b139ca84e092f"
SHA_RPMALLOC="09142d726429416bfa7b459151515fe3ab7622dd"
SHA_UNORDERED_DENSE="3234af2c03549bc85656bfd3a86993bf1cd8aef1"
SHA_XXHASH="e626a72bc2321cd320e953a0ccf1584cad60f363"

SRC_URI="
	https://github.com/FEX-Emu/FEX/archive/refs/tags/FEX-${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/Sonicadvance1/cpp-optparse/archive/${SHA_CPP_OPTPARSE}.tar.gz
		-> ${P}-cpp-optparse-${SHA_CPP_OPTPARSE}.tar.gz
	https://github.com/FEX-Emu/drm-headers/archive/${SHA_DRM_HEADERS}.tar.gz
		-> ${P}-drm-headers-${SHA_DRM_HEADERS}.tar.gz
	https://github.com/fmtlib/fmt/archive/${SHA_FMT}.tar.gz
		-> ${P}-fmt-${SHA_FMT}.tar.gz
	https://github.com/FEX-Emu/jemalloc/archive/${SHA_JEMALLOC}.tar.gz
		-> ${P}-jemalloc-${SHA_JEMALLOC}.tar.gz
	https://github.com/ericniebler/range-v3/archive/${SHA_RANGE_V3}.tar.gz
		-> ${P}-range-v3-${SHA_RANGE_V3}.tar.gz
	https://github.com/FEX-Emu/rpmalloc/archive/${SHA_RPMALLOC}.tar.gz
		-> ${P}-rpmalloc-${SHA_RPMALLOC}.tar.gz
	https://github.com/martinus/unordered_dense/archive/${SHA_UNORDERED_DENSE}.tar.gz
		-> ${P}-unordered_dense-${SHA_UNORDERED_DENSE}.tar.gz
	https://github.com/Cyan4973/xxHash/archive/${SHA_XXHASH}.tar.gz
		-> ${P}-xxhash-${SHA_XXHASH}.tar.gz
"

S="${WORKDIR}/FEX-FEX-${PV}"

# MIT: FEX, cpp-optparse, rpmalloc, unordered_dense
# BSD: fmt
# BSD-2: jemalloc, xxhash
# Boost-1.0: range-v3
# GPL-2: vendored kernel uapi drm headers (header-only, Linux-syscall-note)
LICENSE="MIT BSD BSD-2 Boost-1.0 GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE="fexconfig ${IUSE}"

CMAKE_BUILD_TYPE="Release"

# FEX statically links all of its dependencies; at runtime only glibc is
# required (guest libraries are dlopened on demand).
DEPEND="
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}
	')
	${PYTHON_DEPS}
	sys-kernel/linux-headers
	fexconfig? (
		dev-qt/qtbase
		dev-qt/qtdeclarative
	)
"
BDEPEND="
	dev-build/ninja
	dev-build/cmake
"

src_prepare() {
	cmake_src_prepare

	# The GitHub archive lacks the git submodules the build requires,
	# so populate them from the pinned distfiles.
	local target
	local -A SUBMODS=(
		[External/drm-headers]="drm-headers-${SHA_DRM_HEADERS}"
		[External/fmt]="fmt-${SHA_FMT}"
		[External/jemalloc_glibc]="jemalloc-${SHA_JEMALLOC}"
		[External/range-v3]="range-v3-${SHA_RANGE_V3}"
		[External/rpmalloc]="rpmalloc-${SHA_RPMALLOC}"
		[External/unordered_dense]="unordered_dense-${SHA_UNORDERED_DENSE}"
		[External/xxhash]="xxHash-${SHA_XXHASH}"
		[Source/Common/cpp-optparse]="cpp-optparse-${SHA_CPP_OPTPARSE}"
	)

	for target in "${!SUBMODS[@]}"; do
		rm -rf "${S}/${target}"
		cp -a "${WORKDIR}/${SUBMODS[${target}]}" "${S}/${target}" || die
	done
}

pkg_setup() {
	llvm-r2_pkg_setup
}

src_configure() {
	# Upstream refuses to build with GCC; force clang.
	local llvm_prefix
	llvm_prefix="$(get_llvm_prefix -b)"
	export CC="${llvm_prefix}/bin/clang-${LLVM_SLOT}"
	export CXX="${llvm_prefix}/bin/clang++-${LLVM_SLOT}"

	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DBUILD_FEXCONFIG=$(usex fexconfig)
		-DOVERRIDE_VERSION="${PV}"
		-DOVERRIDE_HASH="9fbdc00"
	)
	cmake_src_configure
}

pkg_postinst() {
	ewarn "FEX emulates x86/x86-64 ELF binaries. The installed binfmt_misc"
	ewarn "handler files in /usr/lib/binfmt.d are picked up automatically by"
	ewarn "systemd-binfmt; on non-systemd setups register them via the"
	ewarn "binfmt_misc interface. Set FEX_ROOTFS to a guest rootfs"
	ewarn "(FEXRootFSFetcher can download one)."
}
