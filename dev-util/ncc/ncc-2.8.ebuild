# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The new generation C compiler"
HOMEPAGE="http://students.ceid.upatras.gr/~sxanth/ncc/"
SRC_URI="http://students.ceid.upatras.gr/~sxanth/ncc/ncc-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake
}

src_install() {
	emake install
}
