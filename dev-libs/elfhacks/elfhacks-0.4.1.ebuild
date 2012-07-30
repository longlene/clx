# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils multilib toolchain-funcs

DESCRIPTION="Various ELF run-time hacks"
HOMEPAGE="http://nullkey.ath.cx/elfhacks/"
SRC_URI="http://nullkey.ath.cx/elfhacks/archive/${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-util/cmake"
RDEPEND=""

EMULTILIB_PKG="true"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
}

src_compile_abi() {
	local abi=$1
	local mybuilddir="${WORKDIR}/build-${abi}"

	mkdir "${mybuilddir}"
	cd "${mybuilddir}"

	cmake "${S}" \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DCMAKE_BUILD_TYPE:STRING="Release" \
		-DCMAKE_CXX_COMPILER:FILEPATH="$(tc-getCXX)" \
		-DCMAKE_CXX_FLAGS_RELEASE:STRING="$(get_abi_var CXXFLAGS ${abi})" \
		-DCMAKE_C_COMPILER:FILEPATH="$(tc-getCC)" \
		-DCMAKE_C_FLAGS_RELEASE:STRING="$(get_abi_CFLAGS ${abi})" \
		-DMLIBDIR="$(get_libdir ${abi})" \
		|| die "cmake (${abi}) failed"
	emake || die "emake (${abi}) failed"
}

src_compile() {
	for ABI in $(get_install_abis); do
		src_compile_abi ${ABI}
	done
}

src_install_abi() {
	local abi=$1
	cd "${WORKDIR}/build-${abi}"
	emake DESTDIR="${D}" install \
		|| die "emake install (${abi}) failed"
}

src_install() {
	for ABI in $(get_install_abis); do
		src_install_abi ${ABI}
	done
}
