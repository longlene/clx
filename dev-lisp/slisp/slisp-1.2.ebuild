# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="SLisp"
HOMEPAGE="http://www.sigala.it/sandro/"
SRC_URI="http://www.sigala.it/sandro/files/slisp-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf --prefix=/usr
}
