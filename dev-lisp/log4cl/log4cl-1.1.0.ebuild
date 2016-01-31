# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Common Lisp logging framework, modeled after Log4J"
HOMEPAGE="https://github.com/7max/log4cl"
SRC_URI="mirror://github/7max/log4cl/archive/v1.1.0.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/bordeaux-threads"
