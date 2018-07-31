# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2101afae90232904d70c1e23c419b114cdc4c840"

DESCRIPTION="A common lisp library providing easy csv reading and writing"
HOMEPAGE="https://github.com/blindglobe/cl-csv"
SRC_URI="https://github.com/blindglobe/cl-csv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/cl-interpol
	dev-lisp/data-table
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r tests
		sed -e '/defsystem\ :cll-csv-test/,$d' -i ${PN}.asd
	fi
}
