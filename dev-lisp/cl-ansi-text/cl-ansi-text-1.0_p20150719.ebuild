# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="53badf7878f27f22f2d4a2a43e6df458e43acbe9"

DESCRIPTION="Enable ANSI colors printing"
HOMEPAGE="https://github.com/pnathan/cl-ansi-text"
SRC_URI="https://github.com/pnathan/cl-ansi-text/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-colors
"

src_prepare() {
	eapply_user
	use test || rm -r test cl-ansi-text-test.asd
}
