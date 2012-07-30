DESCRIPTION="kloc is a source code statistics program."
SRC_URI="http://sarovar.org/download.php/1084/${PN}-${PV}.tar.gz"
HOMEPAGE="http://sarovar.org/projects/kloc/"

IUSE=""
DEPEND=""
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64"

src_install() {
	dodoc README COPYING CREDITS TODO
	dobin bin/kloc
}

