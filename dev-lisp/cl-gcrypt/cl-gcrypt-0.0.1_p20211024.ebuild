# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a75433f19e90a7f2594d5d0ccc1ef7a7ba4b37e4"

DESCRIPTION="Common lisp bindings for libgcrypt"
HOMEPAGE="https://github.com/gorozhin/cl-gcrypt/"
SRC_URI="https://github.com/gorozhin/cl-gcrypt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-libs/libgcrypt
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}
