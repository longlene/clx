# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Portable Animated Graphics"
HOMEPAGE="https://pag.art/"
SRC_URI="
	https://github.com/Tencent/libpag/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/libpag/vendor_tools/archive/13d69976aabcc417048d57ac8437725dc8557a02.tar.gz -> vendor_tools-13d69976aabcc417048d57ac8437725dc8557a02.tar.gz
	https://github.com/libpag/pathkit/archive/f0c4736442a8e640e7f7978b6b9ed322148245bb.tar.gz -> pathkit-f0c4736442a8e640e7f7978b6b9ed322148245bb.tar.gz
	https://github.com/libpag/skcms/archive/26af768d918c8f9a693ce6ee1a0fc6611559d29e.tar.gz -> skcms-26af768d918c8f9a693ce6ee1a0fc6611559d29e.tar.gz
	https://github.com/libpag/libavc/archive/c2bf4c84a6d39788929e59514417e819185af98e.tar.gz -> libavc-c2bf4c84a6d39788929e59514417e819185af98e.tar.gz
	https://github.com/libpag/swiftshader/archive/040ee43bfeba9b6b532dbd8222df737aac2d55b1.tar.gz -> swiftshader-040ee43bfeba9b6b532dbd8222df737aac2d55b1.tar.gz
	https://github.com/madler/zlib/archive/cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz -> zlib-cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz
	https://github.com/glennrp/libpng/archive/a40189cf881e9f0db80511c382292a5604c3c3d1.tar.gz -> libpng-a40189cf881e9f0db80511c382292a5604c3c3d1.tar.gz
	https://github.com/webmproject/libwebp/archive/9ce5843dbabcfd3f7c39ec7ceba9cbeb213cbfdf.tar.gz -> libwebp-9ce5843dbabcfd3f7c39ec7ceba9cbeb213cbfdf.tar.gz
	https://github.com/libjpeg-turbo/libjpeg-turbo/archive/0a9b9721782d3a60a5c16c8c9a7abf3d4b1ecd42.tar.gz -> libjpeg-turbo-0a9b9721782d3a60a5c16c8c9a7abf3d4b1ecd42.tar.gz
	https://github.com/freetype/freetype/archive/86bc8a95056c97a810986434a3f268cbe67f2902.tar.gz -> freetype-86bc8a95056c97a810986434a3f268cbe67f2902.tar.gz
	https://github.com/rttrorg/rttr/archive/7edbd580cfad509a3253c733e70144e36f02ecd4.tar.gz -> rttr-7edbd580cfad509a3253c733e70144e36f02ecd4.tar.gz
	https://github.com/google/googletest/archive/e2239ee6043f73722e7aa812a459f54a28552929.tar.gz -> googletest-e2239ee6043f73722e7aa812a459f54a28552929.tar.gz
	https://github.com/nlohmann/json/archive-fec56a1a16c6e1c1b1f4e116a20e79398282626c.tar.gz -> json-fec56a1a16c6e1c1b1f4e116a20e79398282626c.tar.gz
	https://github.com/harfbuzz/harfbuzz/archive/f1f2be776bcd994fa9262622e1a7098a066e5cf7.tar.gz -> harfbuzz-f1f2be776bcd994fa9262622e1a7098a066e5cf7.tar.gz
	https://github.com/lz4/lz4/archive/5ff839680134437dbf4678f3d0c7b371d84f4964.tar.gz -> lz4-5ff839680134437dbf4678f3d0c7b371d84f4964.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mkdir third_party
	ln -sv "${WORKDIR}"/vendor_tools-13d69976aabcc417048d57ac8437725dc8557a02 vendor_tools
	ln -sv "${WORKDIR}"/pathkit-f0c4736442a8e640e7f7978b6b9ed322148245bb third_party/pathkit
	ln -sv "${WORKDIR}"/skcms-26af768d918c8f9a693ce6ee1a0fc6611559d29e third_party/skcms
	ln -sv "${WORKDIR}"/libavc-c2bf4c84a6d39788929e59514417e819185af98e third_party/libavc
	ln -sv "${WORKDIR}"/swiftshader-040ee43bfeba9b6b532dbd8222df737aac2d55b1 third_party/swiftshader
	ln -sv "${WORKDIR}"/zlib-cacf7f1d4e3d44d871b605da3b647f07d718623f third_party/zlib
	ln -sv "${WORKDIR}"/libpng-a40189cf881e9f0db80511c382292a5604c3c3d1 third_party/libpng
	ln -sv "${WORKDIR}"/libwebp-9ce5843dbabcfd3f7c39ec7ceba9cbeb213cbfdf third_party/libwebp
	ln -sv "${WORKDIR}"/libjpeg-turbo-0a9b9721782d3a60a5c16c8c9a7abf3d4b1ecd42 third_party/libjpeg-turbo
	ln -sv "${WORKDIR}"/freetype-86bc8a95056c97a810986434a3f268cbe67f2902 third_party/freetype
	ln -sv "${WORKDIR}"/rttr-7edbd580cfad509a3253c733e70144e36f02ecd4 third_party/rttr
	ln -sv "${WORKDIR}"/googletest-e2239ee6043f73722e7aa812a459f54a28552929 third_party/googletest
	ln -sv "${WORKDIR}"/json-fec56a1a16c6e1c1b1f4e116a20e79398282626c third_party/json
	ln -sv "${WORKDIR}"/harfbuzz-f1f2be776bcd994fa9262622e1a7098a066e5cf7 third_party/harfbuzz
	ln -sv "${WORKDIR}"/lz4-5ff839680134437dbf4678f3d0c7b371d84f4964 third_party/lz4
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DPAG_USE_SWIFTSHADER=ON
		-DPAG_BUILD_SHARED=OFF
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include
	doins -r include/pag
	dolib.a ${BUILD_DIR}/libpag.a
	einstalldocs
}
