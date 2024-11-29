# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_PV=$(ver_rs 3 ".")

DLPACK_COMMIT="e2bdd3bee8cb6501558042633fa59144cc8b7f5f"
DMLC_CORE_COMMIT="3031e4a61a98f49f07a42cfdec6242340fb2fd8c"
LIBBACKTRACE_COMMIT="08f7c7e69f8ea61a0c4151359bc8023be8e9217b"
RANG_COMMIT="cabe04d6d6b05356fa8f9741704924788f0dd762"

DESCRIPTION="Open deep learning compiler stack for cpu, gpu and specialized accelerators"
HOMEPAGE="https://tvm.apache.org/"
SRC_URI="
	https://github.com/apache/tvm/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz
	https://github.com/dmlc/dlpack/archive/${DLPACK_COMMIT}.tar.gz -> dlpack-${DLPACK_COMMIT}.tar.gz
	https://github.com/dmlc/dmlc-core/archive/${DMLC_CORE_COMMIT}.tar.gz -> dmlc-core-${DMLC_CORE_COMMIT}.tar.gz
	https://github.com/tlc-pack/libbacktrace/archive/${LIBBACKTRACE_COMMIT}.tar.gz -> libbacktrace-${LIBBACKTRACE_COMMIT}.tar.gz
	https://github.com/agauniyal/rang/archive/${RANG_COMMIT}.tar.gz -> rang-${RANG_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="opencl vulkan"

DEPEND="
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${MY_PV}

src_prepare() {
	default
	rmdir 3rdparty/dlpack && ln -sv "${WORKDIR}"/dlpack-${DLPACK_COMMIT} 3rdparty/dlpack
	rmdir 3rdparty/dmlc-core && ln -sv "${WORKDIR}"/dmlc-core-${DMLC_CORE_COMMIT} 3rdparty/dmlc-core
	rmdir 3rdparty/libbacktrace && ln -sv "${WORKDIR}"/libbacktrace-${LIBBACKTRACE_COMMIT} 3rdparty/libbacktrace
	rmdir 3rdparty/rang && ln -sv "${WORKDIR}"/rang-${RANG_COMMIT} 3rdparty/rang
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_OPENCL=$(usex opencl)
		-DUSE_VULKAN=$(usex vulkan)
	)
	cmake_src_configure
}
