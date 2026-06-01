# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Standalone Luau runtime for general-purpose programming"
HOMEPAGE="https://lute.luau.org/ https://github.com/luau-lang/lute"

MY_LUAU_VER="0.716"
MY_LIBUV_VER="1.50.0"
MY_ZLIB_VER="1.3.1"
MY_BORINGSSL_VER="0.20250415.0"
MY_CURL_VER="8_13_0"
MY_LIBSODIUM_VER="1.0.20"
MY_USOCKETS_VER="0.8.8"
MY_UWEBSOCKETS_VER="20.74.0"

SRC_URI="
	https://github.com/luau-lang/lute/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/luau-lang/luau/archive/refs/tags/${MY_LUAU_VER}.tar.gz -> luau-${MY_LUAU_VER}.gh.tar.gz
	https://github.com/libuv/libuv/archive/refs/tags/v${MY_LIBUV_VER}.tar.gz -> libuv-${MY_LIBUV_VER}.gh.tar.gz
	https://github.com/madler/zlib/archive/refs/tags/v${MY_ZLIB_VER}.tar.gz -> zlib-${MY_ZLIB_VER}.gh.tar.gz
	https://github.com/google/boringssl/archive/refs/tags/${MY_BORINGSSL_VER}.tar.gz -> boringssl-${MY_BORINGSSL_VER}.gh.tar.gz
	https://github.com/curl/curl/archive/refs/tags/curl-${MY_CURL_VER}.tar.gz -> curl-${MY_CURL_VER}.gh.tar.gz
	https://github.com/jedisct1/libsodium/archive/refs/tags/${MY_LIBSODIUM_VER}-RELEASE.tar.gz -> libsodium-${MY_LIBSODIUM_VER}.gh.tar.gz
	https://github.com/uNetworking/uSockets/archive/refs/tags/v${MY_USOCKETS_VER}.tar.gz -> uSockets-${MY_USOCKETS_VER}.gh.tar.gz
	https://github.com/uNetworking/uWebSockets/archive/refs/tags/v${MY_UWEBSOCKETS_VER}.tar.gz -> uWebSockets-${MY_UWEBSOCKETS_VER}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-lang/go"

src_unpack() {
	default
	mv "${WORKDIR}/luau-${MY_LUAU_VER}" "${S}/extern/luau" || die
	mv "${WORKDIR}/libuv-${MY_LIBUV_VER}" "${S}/extern/libuv" || die
	mv "${WORKDIR}/zlib-${MY_ZLIB_VER}" "${S}/extern/zlib" || die
	mv "${WORKDIR}/boringssl-${MY_BORINGSSL_VER}" "${S}/extern/boringssl" || die
	mv "${WORKDIR}/curl-curl-${MY_CURL_VER}" "${S}/extern/curl" || die
	mv "${WORKDIR}/libsodium-${MY_LIBSODIUM_VER}-RELEASE" "${S}/extern/libsodium" || die
	mv "${WORKDIR}/uSockets-${MY_USOCKETS_VER}" "${S}/extern/uSockets" || die
	mv "${WORKDIR}/uWebSockets-${MY_UWEBSOCKETS_VER}" "${S}/extern/uWebSockets" || die
}

src_prepare() {
	# Place template stubs so cmake can configure before the full generate step
	mkdir -p lute/std/src/generated || die
	cp tools/templates/std_impl.cpp lute/std/src/generated/modules.cpp || die
	cp tools/templates/std_header.h lute/std/src/generated/modules.h || die

	mkdir -p lute/cli/generated || die
	cp tools/templates/cli_impl.cpp lute/cli/generated/commands.cpp || die
	cp tools/templates/cli_header.h lute/cli/generated/commands.h || die

	mkdir -p lute/batteries/generated || die
	cp tools/templates/batteries_impl.cpp lute/batteries/generated/batteries.cpp || die
	cp tools/templates/batteries_header.h lute/batteries/generated/batteries.h || die

	mkdir -p lute/definitions/src/generated || die
	cp tools/templates/definitions_impl.cpp lute/definitions/src/generated/modules.cpp || die
	cp tools/templates/definitions_header.h lute/definitions/src/generated/modules.h || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLUTE_ENABLE_SANITIZERS=OFF
	)
	cmake_src_configure
}

src_compile() {
	# Stage 1: build a minimal lute binary with template stubs
	cmake_src_compile

	# Stage 2: use stage-1 binary to generate actual embedded Luau sources.
	# luthier.luau resolves @batteries/* from the filesystem via tools/.luaurc,
	# so it works even though the batteries are empty stubs in the binary.
	"${BUILD_DIR}/lute/cli/lute" "${S}/tools/luthier.luau" generate \
		|| die "luthier generate failed"

	# Stage 3: recompile with the real embedded Luau sources
	cmake_src_compile
}

src_install() {
	dobin "${BUILD_DIR}/lute/cli/lute"
}
