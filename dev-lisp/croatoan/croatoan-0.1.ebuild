# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Common Lisp bindings for the ncurses terminal library"
HOMEPAGE="https://github.com/McParen/croatoan"
SRC_URI="https://github.com/McParen/croatoan/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/trivial-gray-streams
	sys-libs/ncurses
"

src_prepare() {
	default
	rm -rf ${PN}-test.asd test ansi-escape-test.asd
}
