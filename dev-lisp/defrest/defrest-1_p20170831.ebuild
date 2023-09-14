# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="169ca3b8e05d7ec82d3264bb03c330ba57f84307"

DESCRIPTION="An easy Common Lisp REST/ajax service definer for hunchentoot"
HOMEPAGE="https://github.com/bonkzwonil/defrest"
SRC_URI="https://github.com/bonkzwonil/defrest/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ :defrest.test/,$d' ${PN}.asd
		rm -r tests
	fi
}


