# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="95e5471475bbe94ea631ad997b30dfc495ae28d0"

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
