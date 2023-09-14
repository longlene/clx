EAPI=8

DESCRIPTION="Use MySQL servers"
HOMEPAGE="http://rudeserver.com/config/index.html"
SRC_URI="http://www.rudeserver.com/database/download/${PF}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=sys-devel/gcc-3"

src_install() {
	emake DESTDIR="${D}" install LIBRARY_PATH="${D}/usr/$(get_libdir)"
	dodoc README
	doman "${S}"/man/*
}
