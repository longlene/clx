# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="878923f18c8e5cddd78e4f73eb4049c127d4f3f2"

DESCRIPTION="Common Lisp library that facilitates working with Common Lisp arrays"
HOMEPAGE="https://github.com/tpapp/array-operations"
SRC_URI="https://github.com/bendudson/array-operations/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/let-plus
	dev-lisp/optima
	test? ( dev-lisp/clunit )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:array-operations-tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
