# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1ac81087e1b51e787b64d836a4cc62642aa56292"

DESCRIPTION="Array slices for Common Lisp"
HOMEPAGE="https://github.com/tpapp/cl-slice"
SRC_URI="https://github.com/tpapp/cl-slice/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/let-plus
	test? ( dev-lisp/clunit )
"

src_prepare() {
	eapply_user
	if ! use test; then
		sed -i '/defsystem #:cl-slice-tests/,$d' ${PN}.asd
		rm cl-slice-tests.lisp
	fi
}
