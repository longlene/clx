# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Apache Lucy search engine library"
HOMEPAGE="http://lucy.apache.org"
SRC_URI="mirror://apache/lucy/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# TODO: maybe perl, ruby USE need be added?

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/apache-clownfish"


src_configure() {
	cd "${S}"/runtime/c && econf
}

src_compile() {
	cd "${S}"/runtime/c && emake
}

src_install() {
	cd "${S}"/runtime/c && emake install
}
