# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="C library for reading tarfiles, stripped down version of libtar"
HOMEPAGE="https://github.com/justincormack/libuntar"
SRC_URI=""

EGIT_REPO_URI="https://github.com/justincormack/libuntar.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake lib || die "compile failed"
}

src_install() {
	insinto /usr/include
	doins lib/libuntar.h
	dolib.a lib/libuntar.a
	dodoc README.md
}
