# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bd123bf618e7c8e0dd489401944d7ce409aa8583"

DESCRIPTION="UNIX signal handling library for Common Lisp"
HOMEPAGE="https://github.com/guicho271828/trivial-signal"
SRC_URI="https://github.com/guicho271828/trivial-signal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}

