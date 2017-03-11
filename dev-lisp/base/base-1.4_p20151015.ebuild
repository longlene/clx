# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="498fd7224748a1cceaa6127edcedab6e3563aa84"

DESCRIPTION="Universally useful Lisp code that lives in package com.google.base"
HOMEPAGE="https://github.com/brown/base"
SRC_URI="https://github.com/brown/base/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-utf8
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -r com.google.base-test.asd base_test.lisp
}
