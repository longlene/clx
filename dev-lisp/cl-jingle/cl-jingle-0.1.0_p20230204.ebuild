# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d8a6308b7be9d499efde40693cfbe95ba113beec"

DESCRIPTION="Common Lisp web framework with bells and whistles"
HOMEPAGE="https://github.com/dnaeon/cl-jingle"
SRC_URI="https://github.com/dnaeon/cl-jingle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/str
	dev-lisp/quri
	dev-lisp/myway
	dev-lisp/lack
	dev-lisp/clack
	dev-lisp/ningle
	dev-lisp/cl-reexport
	dev-lisp/local-time
	dev-lisp/jonathan
	dev-lisp/find-port
"
BDEPEND=""

src_prepare() {
	default
	rm -rf jingle.demo.asd jingle.demo.test.asd jingle.test.asd demo tests
}
