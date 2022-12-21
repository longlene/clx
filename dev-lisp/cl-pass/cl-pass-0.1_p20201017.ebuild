# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e58e97c0c0588dc742c061208afb9bc31e4dbd34"

DESCRIPTION="Password hashing and verification library"
HOMEPAGE="https://github.com/eudoxia0/cl-pass"
SRC_URI="https://github.com/eudoxia0/cl-pass/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/trivial-utf8
	dev-lisp/split-sequence
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
