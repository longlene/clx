# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="53a93ff396d178dfb41fafb99d23d4446d864351"

DESCRIPTION="Web application environment for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/clack"
SRC_URI="https://github.com/fukamachi/clack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lack
	dev-lisp/bordeaux-threads
	dev-lisp/cl-fastcgi
	dev-lisp/alexandria
	dev-lisp/flexi-streams
	dev-lisp/usocket
	dev-lisp/quri
	dev-lisp/split-sequence
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
	dev-lisp/ironclad
	|| (
		dev-lisp/hunchentoot
		dev-lisp/toot
		dev-lisp/cl-fastcgi
		dev-lisp/wookie
	)

	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	rm -r v1-compat ${PN}-v1-compat.asd
	use test || rm -r t-*.asd t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
