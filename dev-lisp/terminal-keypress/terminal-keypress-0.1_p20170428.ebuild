# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="07a78346a0f478d8cdd2cf0563ed66bd39de55f4"

DESCRIPTION="Read keyboard events in the terminal from Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/terminal-keypress"
SRC_URI="https://github.com/eudoxia0/terminal-keypress/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-raw-io
	dev-lisp/alexandria
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
