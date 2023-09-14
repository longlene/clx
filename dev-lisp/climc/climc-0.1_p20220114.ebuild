# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="35600bd276a5e02bda0b466bd05fdfeaa1ca0f15"

DESCRIPTION="A Common Lisp Instant Messaging Client"
HOMEPAGE="https://github.com/nlamirault/climc"
SRC_URI="https://github.com/nlamirault/climc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mcclim
	dev-lisp/cl-xmpp
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
