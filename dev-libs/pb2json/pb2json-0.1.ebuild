# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Decode protobuf json format"
HOMEPAGE="https://github.com/renenglish/pb2json"
SRC_URI="https://github.com/renenglish/pb2json/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/jansson
dev-libs/protobuf"

src_compile() {
	if use static ; then
		emake lib${PN}.a
	else
		emake lib${PN}.so
	fi
}

src_install() {
	if use static ; then
		dolib.a lib${PN}.a
	else
		dolib.so lib${PN}.so
	fi
}
