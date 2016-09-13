# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit common-lisp-3

DESCRIPTION="Prepare HTML documentation for Common Lisp libraries"
HOMEPAGE="http://weitz.de/documentation-template"
SRC_URI="http://weitz.de/files/documentation-template.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/cl-who"

scr_install() {
	common-lisp-install ${PN}.asd *.lisp

	common-lisp-symlink-asdf

	dodoc doc/index.html  CHANGELOG.txt
}
