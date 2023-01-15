# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6dbe6a6c0735b48f7e93db1515b272aed0712918"

DESCRIPTION="Common Lisp library that facilitates working with Common Lisp arrays"
HOMEPAGE="https://github.com/tpapp/array-operations"
SRC_URI="https://github.com/Lisp-Stat/array-operations/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/array-operations
	dev-lisp/let-plus
"

src_prepare() {
	default
	sed -e '/defsystem #:array-operations\/tests/,$d' \
		-i ${PN}.asd
	rm -r tests
}
