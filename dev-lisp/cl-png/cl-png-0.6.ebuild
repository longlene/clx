# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3
DESCRIPTION="Common Lisp package to read and write png image files from Ljosa"
HOMEPAGE="http://www.ljosa.com/~ljosa/software/cl-png/"
SRC_URI="http://www.ljosa.com/~ljosa/software/cl-png/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} dev-lisp/cffi"

#S="${WORKDIR}/cl-${P}"
#src_unpack() {
#   unpack ${A}
#}
src_install() {
	common-lisp-install *.lisp ${PN}.asd
	common-lisp-symlink-asdf
	dodoc AUTHORS COPYING NEWS README
	dohtml doc/index.html
}
