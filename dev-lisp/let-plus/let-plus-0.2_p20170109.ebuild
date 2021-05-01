# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="77efafd94aba3943d4289fcc88377fe9240448a8"

DESCRIPTION="destructuring extension of let*"
HOMEPAGE="https://github.com/tpapp/let-plus"
SRC_URI="https://github.com/tpapp/let-plus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	test? ( dev-lisp/lift )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/asdf:defsystem\ #:let-plus-tests/,$d' ${PN}.asd
		rm tests.lisp
	fi
}

