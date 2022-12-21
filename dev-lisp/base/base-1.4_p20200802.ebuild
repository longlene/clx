# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e7a1233771c00fe4e178427872968d5a849df525"

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
	default
	if ! use test ; then
		sed -e '/defsystem com.google.base\/test/,$d' \
			-i com.google.base.asd
		rm base-test.lisp
	fi
}
