# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d2472061d86b1cf3d32f388daacd4e32a13af699"

DESCRIPTION="Download files from Common Lisp trhough Drakma"
HOMEPAGE="https://github.com/eudoxia0/trivial-download"
SRC_URI="https://github.com/eudoxia0/trivial-download/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	test? ( dev-lisp/fiveam dev-lisp/clack )
"

src_prepare() {
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
