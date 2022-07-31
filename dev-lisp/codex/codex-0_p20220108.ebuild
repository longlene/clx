# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bc1c1d17e1df5e7d6ecc759256b9d396008824bc"

DESCRIPTION="A documentation system for Common Lisp"
HOMEPAGE="http://commondoc.github.io/codex/"
SRC_URI="https://github.com/shamazmazum/codex/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/docparser
	dev-lisp/common-doc
	dev-lisp/pandocl
	dev-lisp/cl-slug
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/common-html
	dev-lisp/djula
	dev-lisp/trivial-types
	test? (
		dev-lisp/vertex
		dev-lisp/fiveam
	)
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md templates
}
