# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7588b430ad7c52f91a119b4b1c9a549d584b7064"

DESCRIPTION="ESRAP -- a packrat parser for Common Lisp"
HOMEPAGE="git://github.com/scymtym/esrap.git"
SRC_URI="https://github.com/scymtym/esrap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/eos )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -e '/esrap-tests/,$d' -i esrap.asd
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README
}
