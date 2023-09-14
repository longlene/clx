# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A common lisp image representation and processing library"
HOMEPAGE="http://cyrusharmon.org/projects?project=ch-image"
SRC_URI="http://cyrusharmon.org/static/releases/ch-image_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="jpeg tiff freetype"

DEPEND=""
RDEPEND="${DEPEND}
jpeg? ( dev-lisp/cl-jpeg )
tiff? ( dev-lisp/tiff-ffi )
freetype? ( dev-lisp/freetype-ffi )
dev-lisp/ch-util
dev-lisp/clem
dev-lisp/zpng"

src_prepare() {
	#sed -i -e '69,73s/^/;/' -e '$a))' ${PN}.asd
	epatch "${FILESDIR}/${P}-funtoo-fixes.patch"
}
