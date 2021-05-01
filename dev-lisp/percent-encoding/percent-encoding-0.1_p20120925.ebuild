# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c1224e22bc8048fbd3ebbc9329715a0c1b673170"

DESCRIPTION="RFC 3986 percent-encoding library"
HOMEPAGE="https://github.com/llibra/percent-encoding"
SRC_URI="https://github.com/llibra/percent-encoding/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/babel
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r t
		sed -e '/(defsystem :percent-encoding-test/,$d' -i ${PN}.asd
	fi
}
