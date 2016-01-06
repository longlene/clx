# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Allocate SIMPLE-ARRAYs in static memory"
HOMEPAGE="https://github.com/sionescu/static-vectors/"
SRC_URI="https://github.com/sionescu/static-vectors/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cffi"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
