# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="be915bb9d29ce10dc6e746cf5fc8b4ba4bb82c55"

DESCRIPTION="Common Lisp bindings for the ncurses terminal library"
HOMEPAGE="https://github.com/McParen/croatoan"
SRC_URI="https://github.com/McParen/croatoan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-gray-streams
	sys-libs/ncurses
"
