# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Coroutine library for C/C++"
HOMEPAGE="https://github.com/tencent-wechat/libco"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tencent-wechat/libco.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	local mytarget="libcolib.so"
	use static-libs && mytarget+="libcolib.a"
	emake ${mytarget}
}

src_install() {
	dolib.so solib/libcolib.so
	use static-libs && dolib.a libcolib.a
	dodoc README.md
}
