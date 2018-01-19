# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e6801c6ae31f2987404d3c1a95704ec7b91bb5ee"

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
