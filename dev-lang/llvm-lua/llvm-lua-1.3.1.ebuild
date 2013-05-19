# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils pax-utils

MY_PN="${PN//-/_}"

DESCRIPTION="JIT and static Lua compiler that uses LLVM as the compiler backend"
HOMEPAGE="http://code.google.com/p/llvm-lua/"
SRC_URI="http://llvm-lua.googlecode.com/files/${MY_PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

LLVM="2.8"

DEPEND=">=sys-devel/llvm-$LLVM
		|| (
			>=sys-devel/clang-$LLVM
			>=sys-devel/llvm-gcc-$LLVM
		)"
RDEPEND="${DEPEND}"

S="$WORKDIR/$MY_PN-$PV"

src_prepare() {
	epatch "$FILESDIR/$PV-no-no-jit.patch"
}

src_install() {
	cmake-utils_src_install
	pax-mark m "$D/usr/bin/llvm-lua"
	pax-mark m "$D/usr/bin/llvm-luac"
}

