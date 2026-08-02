# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Google's LLM inference framework for edge devices"
HOMEPAGE="https://ai.google.dev/edge/litert-lm https://github.com/google-ai-edge/LiteRT-LM"
SRC_URI="https://github.com/google-ai-edge/LiteRT-LM/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/LiteRT-LM-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/cmake
	dev-lang/rust
	dev-libs/protobuf
	dev-libs/flatbuffers
"

# The top-level CMakeLists.txt is only an ExternalProject orchestrator.
# The real cmake source lives in cmake/packages/litert_lm/.
CMAKE_USE_DIR="${S}/cmake/packages/litert_lm"

src_configure() {
	local mycmakeargs=(
		"-DLITERTLM_PROJECT_ROOT=${S}"
		"-DLITERTLM_HOST_PROTOC=/usr/bin/protoc"
		"-DLITERTLM_HOST_PROTOC_BIN_DIR=/usr/bin"
		"-DLITERTLM_HOST_FLATC=/usr/bin/flatc"
		"-DLITERTLM_HOST_FLATC_BIN_DIR=/usr/bin"
	)
	cmake_src_configure
}

src_compile() {
	# libcxxbridge1.a is copied to the build root by a POST_BUILD cmake script
	# but not declared as a BYPRODUCT, so ninja has no rule to create it.
	# Building litertlm_cxx_bridge first triggers the POST_BUILD copy so the
	# file exists when the litert_lm_main link step runs.
	cmake_build litertlm_cxx_bridge
	cmake_src_compile
}

src_install() {
	dobin "${CMAKE_USE_DIR}_build/litert_lm_main"
	insinto /usr/include/litert-lm
	doins "${S}/c/engine.h"
}
