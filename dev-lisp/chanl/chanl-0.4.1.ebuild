# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Portable channel-based concurrency for Common Lisp"
HOMEPAGE="https://github.com/sykopomp/chanl"
SRC_URI="https://github.com/sykopomp/chanl/archive/v0.4.1.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/bordeaux-threads"

