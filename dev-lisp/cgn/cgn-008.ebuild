# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="a library to interface Gnuplot from Common Lisp"
HOMEPAGE="http://common-lisp.net/project/nixies/"
SRC_URI="http://mydebian.googlecode.com/files/cgn-008.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/ltk"

src_install() {
	common-lisp-3_src_install
	dodoc doc/cgn.pdf
}
