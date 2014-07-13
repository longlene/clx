# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit multilib vcs-snapshot

DESCRIPTION="The Apache Kafka C/C++ library"
HOMEPAGE="https://github.com/edenhill/librdkafka"
SRC_URI="https://github.com/edenhill/librdkafka/archive/debian/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/zlib"

src_prepare() {
	sed -i "s/DESTDIR\/lib/DESTDIR\/$(get_libdir)/" Makefile
}

src_compile() {
	emake -j1
}

src_install() {
	emake DESTDIR="${D}" install
}
