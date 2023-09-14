# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="455e657e077235829b197f7ccafd596fcda69e30"

DESCRIPTION="destructuring extension of let*"
HOMEPAGE="https://github.com/tpapp/let-plus"
SRC_URI="https://github.com/sharplispers/let-plus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
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
	default
	if ! use test ; then
		sed -e '/defsystem #:let-plus\/tests/,$d' \
			-i ${PN}.asd
		rm tests.lisp
	fi
}

