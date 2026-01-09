# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

NPU_COMPILER_ELF_COMMIT="9d91134722e70bf52297adaeb221a0be8e408b14"

DESCRIPTION="Intel® NPU (Neural Processing Unit) Driver"
HOMEPAGE="https://github.com/intel/linux-npu-driver"
SRC_URI="
	https://github.com/intel/linux-npu-driver/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/openvinotoolkit/npu_compiler_elf/archive/${NPU_COMPILER_ELF_COMMIT}.tar.gz -> npu-compiler-elf-${NPU_COMPILER_ELF_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-cpp/yaml-cpp
	dev-libs/level-zero-npu-extensions
"
BDEPEND=""

S="${WORKDIR}"/linux-npu-driver-${PV}

src_prepare() {
	default
	eapply "${FILESDIR}"/system-deps.patch
	rmdir third_party/npu_compiler_elf && ln -sv "${WORKDIR}"/npu_compiler_elf-${NPU_COMPILER_ELF_COMMIT} third_party/npu_compiler_elf
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		#-DENABLE_OPENVINO_PACKAGE=ON
		-DENABLE_VALIDATION_BUILD=OFF
	)
	cmake_src_configure
}
