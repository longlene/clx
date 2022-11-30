# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="87a447a8eaef9cf4fd1c16d407a49f9adaf8adad"

DESCRIPTION="Allocate SIMPLE-ARRAYs in static memory"
HOMEPAGE="https://github.com/sionescu/static-vectors/"
SRC_URI="https://github.com/sionescu/static-vectors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
"

src_prepare() {
	default
	sed -e '/defsystem :static-vectors\/test/,$d' \
		-i ${PN}.asd
	rm -rf tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
