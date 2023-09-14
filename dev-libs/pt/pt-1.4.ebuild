# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A extremely lightweight, stackless thread library"
HOMEPAGE="http://dunkels.com/adam/pt/"
SRC_URI="http://dunkels.com/adam/download/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins pt.h lc.h lc-switch.h pt-sem.h lc-addrlabels.h
}
