# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="A simple lexing library"
HOMEPAGE="https://github.com/jtmurphy/liblex"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/jtmurphy/liblex.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a liblex.a
	insinto /usr/include
	doins lex.h
	dodoc README.md
}
