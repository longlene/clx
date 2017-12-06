# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8ec91b67ca6ed891831d02fe9534bc22bc36fe85"

DESCRIPTION="A lightweight web application framework for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/ningle"
SRC_URI="https://github.com/fukamachi/ningle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/myway
	dev-lisp/clack
	dev-lisp/cl-syntax
	dev-lisp/alexandria
"

src_prepare() {
	eapply_user
	use test || rm -rf t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
