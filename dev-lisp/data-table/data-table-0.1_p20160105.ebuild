# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="266f8a264c00dc75dd4e17adba612f3789425b5d"

DESCRIPTION="A Common Lisp data structure representing tabular data"
HOMEPAGE="https://github.com/AccelerationNet/data-table"
SRC_URI="https://github.com/AccelerationNet/data-table/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/symbol-munger
	dev-lisp/alexandria
	dev-lisp/cl-interpol
	dev-lisp/clsql
	dev-lisp/collectors
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r tests
		sed -e '/defsystem\ :data-table-test/,$d' -i ${PN}.asd
	fi
}
