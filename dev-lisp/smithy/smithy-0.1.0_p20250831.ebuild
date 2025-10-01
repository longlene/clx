# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="1c948a1e3b3ddf3fe7ad1a034c9d137ed77e7b38"

DESCRIPTION="Smithy code generator for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/smithy-lisp"
SRC_URI="https://github.com/fukamachi/smithy-lisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/split-sequence
	dev-lisp/kebab
	dev-lisp/yason
	dev-lisp/babel
	dev-lisp/assoc-utils
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "smithy\/tests"/,$d' \
		-i smithy.asd
	rm -rf tests
}
