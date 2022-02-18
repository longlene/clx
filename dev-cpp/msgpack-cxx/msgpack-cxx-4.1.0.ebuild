# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
inherit cmake-multilib

DESCRIPTION="MessagePack is a binary-based efficient data interchange format"
HOMEPAGE="https://msgpack.org/ https://github.com/msgpack/msgpack-c/"
SRC_URI="https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/${P}.tar.gz"

KEYWORDS="amd64 ~arm ~arm64 ~riscv x86 ~amd64-linux ~x86-linux ~x64-macos"
LICENSE="Boost-1.0"
SLOT="0/2"
IUSE="boost doc examples test"
RESTRICT="!test? ( test )"

BDEPEND="doc? ( app-doc/doxygen[dot] )"
RDEPEND="boost? ( dev-libs/boost[context,${MULTILIB_USEDEP}] )"
DEPEND="${RDEPEND}
	test? (
		>=dev-cpp/gtest-1.6.0-r2[${MULTILIB_USEDEP}]
		sys-libs/zlib[${MULTILIB_USEDEP}]
	)
"

multilib_src_configure() {
	local mycmakeargs=(
		-DMSGPACK_USE_BOOST="$(usex boost)"
		-DMSGPACK_BUILD_TESTS="$(usex test)"
		# don't build the examples
		-DMSGPACK_BUILD_EXAMPLES=OFF
		# enable C++14 by default
		-DMSGPACK_CXX14=ON
	)

	cmake_src_configure
}

multilib_src_compile() {
	cmake_src_compile

	if multilib_is_native_abi && use doc; then
		cmake_build doxygen
	fi
}

multilib_src_install() {
	if multilib_is_native_abi; then
		if use doc; then
			local HTML_DOCS=( "${BUILD_DIR}"/docs/. )

			mkdir docs || die
			mv doc_c/html docs/c || die
			mv doc_cpp/html docs/cpp || die
		fi

		if use examples; then
			docinto examples
			dodoc -r "${WORKDIR}/${P}/example/."
			docompress -x /usr/share/doc/${PF}/examples
		fi
	fi

	cmake_src_install
}
