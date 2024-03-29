# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib

DESCRIPTION="High-performance messaging interface for distributed applications"
HOMEPAGE="https://nanomsg.org/"
SRC_URI="https://github.com/nanomsg/nanomsg/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0/5.0.0"
KEYWORDS="amd64 ~arm ~arm64 ~hppa ~ppc ~riscv x86"
IUSE="doc"

DEPEND="doc? ( dev-ruby/asciidoctor )"

multilib_src_prepare() {
	# Old CPUs like HPPA fails test because of timeout
	sed -i \
		-e '/inproc_shutdown/s/5/80/' \
		-e '/ws_async_shutdown/s/5/80/' \
		-e '/ipc_shutdown/s/30/80/' CMakeLists.txt || die

	cmake_src_prepare
}

multilib_src_configure() {
	local mycmakeargs=(
		-DNN_STATIC_LIB=OFF
	)
	if multilib_is_native_abi; then
		mycmakeargs+=(
			-DNN_ENABLE_DOC=$(usex doc ON OFF)
		)
	else
		mycmakeargs+=(
			-DNN_ENABLE_DOC=OFF
			-DNN_TOOLS=OFF
			-DNN_ENABLE_NANOCAT=OFF
		)
	fi
	cmake_src_configure
}
