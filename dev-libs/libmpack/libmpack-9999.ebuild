# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Simple implementation of msgpack of C"
HOMEPAGE="https://github.com/tarruda/libmpack"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tarruda/libmpack.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="sys-devel/llvm"
RDEPEND="${DEPEND}"

src_compile() {
	config=release emake
}

src_install() {
	insinto /usr/include
	doins build/mpack.h
	dolib.a build/release/.libs/libmpack.a
	dodoc README.md
}
