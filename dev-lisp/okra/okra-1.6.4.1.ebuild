# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="CFFI bindings to Ogre"
HOMEPAGE="https://github.com/aerique/okra"
SRC_URI="https://github.com/aerique/okra/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-games/ogre
dev-lisp/cffi
dev-lisp/cl-ppcre
dev-lisp/html-template
dev-lisp/iterate
dev-lisp/parse-number
dev-lisp/s-xml"

