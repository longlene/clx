# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fb83ff094d330b2208b0febc8b25983c6050e378"

DESCRIPTION="JSON encoder and decoder"
HOMEPAGE="https://rudolph-miller.github.io/jonathan/overview.html"
SRC_URI="https://github.com/Rudolph-Miller/jonathan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/fast-io
	dev-lisp/trivial-types
	dev-lisp/babel
	dev-lisp/proc-parse
	dev-lisp/cl-ppcre
	dev-lisp/cl-annot
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}

