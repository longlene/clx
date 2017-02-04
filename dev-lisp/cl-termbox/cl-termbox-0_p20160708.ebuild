# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d6124191e8b0140bfceb5c9f43d67be2080f7cee"

DESCRIPTION="A Common Lisp wrapper around nsf/termbox"
HOMEPAGE="https://github.com/fouric/cl-termbox"
SRC_URI="https://github.com/fouric/cl-termbox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/termbox
	dev-lisp/cl-autowrap
	dev-lisp/trivial-garbage
"

src_prepare() {
	eapply_user
	rm test.lsp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src/autospec
}
