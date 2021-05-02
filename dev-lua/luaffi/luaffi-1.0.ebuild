# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit multilib toolchain-funcs

DESCRIPTION="Standalone FFI library for calling C functions from lua"
HOMEPAGE="https://github.com/jmckaskill/luaffi"
SRC_URI="https://github.com/jmckaskill/luaffi/archive/${PV}-work1.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}-work1

src_compile() {
	emake ffi.so || die "compile failew"
}

src_install() {
	insinto $($(tc-getPKG_CONFIG) --variable INSTALL_CMOD lua)
	doins ffi.so
}
