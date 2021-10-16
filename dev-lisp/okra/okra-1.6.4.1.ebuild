# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake common-lisp-3

DESCRIPTION="CFFI bindings to Ogre"
HOMEPAGE="https://github.com/aerique/okra"
SRC_URI="https://github.com/aerique/okra/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-games/mygui[ogre]
	dev-games/ogre
	dev-lisp/cffi
	dev-lisp/cl-ppcre
	dev-lisp/html-template
	dev-lisp/iterate
	dev-lisp/parse-number
	dev-lisp/s-xml
"

src_install() {
	cmake_src_install
	common-lisp-3_src_install
}
