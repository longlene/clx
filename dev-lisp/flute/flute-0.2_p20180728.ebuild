# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="90ebcd6e82f637f49b6de7d625ccc51ec4c92900"

DESCRIPTION="A beautiful, easilly composable HTML5 generation library in Common Lisp"
HOMEPAGE="https://github.com/ailisp/flute"
SRC_URI="https://github.com/ailisp/flute/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/assoc-utils
	dev-lisp/let-over-lambda
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
