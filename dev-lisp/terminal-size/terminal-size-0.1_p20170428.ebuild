# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fa1bfef1f77eac3ee12c0ed698afc6f9489c7576"

DESCRIPTION="Get the size of the terminal from Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/terminal-size"
SRC_URI="https://github.com/eudoxia0/terminal-size/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/osicat
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
