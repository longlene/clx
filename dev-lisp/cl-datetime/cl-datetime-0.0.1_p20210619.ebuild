# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0a8f9f3a167bcba7d63b1f3e027fb24a9b078bee"

DESCRIPTION="A Common Lisp library to deal with date and time"
HOMEPAGE="https://github.com/muyinliu/cl-datetime"
SRC_URI="https://github.com/muyinliu/cl-datetime/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-ppcre
	dev-lisp/named-readtables
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
