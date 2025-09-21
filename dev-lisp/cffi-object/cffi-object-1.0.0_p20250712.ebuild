# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5bff484a5bd62d679ba7cdcaa29a31fa5787ab91"

DESCRIPTION="A Common Lisp library that enables fast and convenient interoperation with foreign objects"
HOMEPAGE="https://github.com/bohonghuang/cffi-object"
SRC_URI="https://github.com/bohonghuang/cffi-object/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-garbage
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem cffi-object\/test/,$d' \
		-i cffi-object.asd
	rm -rf test
}
