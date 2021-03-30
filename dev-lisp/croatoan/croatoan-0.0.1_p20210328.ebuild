# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0e4555604608c4716fe5006610cc686719753ebe"

DESCRIPTION="Common Lisp bindings for the ncurses terminal library"
HOMEPAGE="https://github.com/McParen/croatoan"
SRC_URI="https://github.com/McParen/croatoan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
