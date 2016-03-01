# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A very sane C++14 JSON library"
HOMEPAGE="https://github.com/jeaye/jeayeson"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jeaye/jeayeson.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	:
}
src_compile() {
	:
}

src_install() {
	insinto /usr
	doins -r include
	dodoc README.md
}
