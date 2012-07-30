EAPI="2"

inherit eutils

DESCRIPTION="Read and Write Configuration/.ini file"
HOMEPAGE="http://rudeserver.com/config/index.html"
SRC_URI="http://rudeserver.com/config/download/${PF}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=sys-devel/gcc-3"

src_install() {
	emake DESTDIR="${D}" install LIBRARY_PATH="${D}/usr/$(get_libdir)" || die "install failed"
	dodoc README
	doman "${S}"/man/*
}