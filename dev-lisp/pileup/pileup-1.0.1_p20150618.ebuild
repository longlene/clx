# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f269473a570a8e55881082545ee63cfe5c7d3e72"

DESCRIPTION="A simple thread-safe binary heap implementation for Common Lisp"
HOMEPAGE="http://nikodemus.github.com/pileup/"
SRC_URI="https://github.com/nikodemus/pileup/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README LICENCE
}
