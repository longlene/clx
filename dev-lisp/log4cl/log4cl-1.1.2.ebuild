# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3

DESCRIPTION="Common Lisp logging framework, modeled after Log4J"
HOMEPAGE="https://github.com/7max/log4cl"
SRC_URI="https://github.com/7max/log4cl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/stefil
"

src_prepare() {
	use example || rm -rf ${PN}-examples.asd examples
}
