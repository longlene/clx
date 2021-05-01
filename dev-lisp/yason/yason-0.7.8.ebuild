# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Common Lisp JSON serializer written with simplicity in mind"
HOMEPAGE="https://github.com/hanshuebner/yason/ http://common-lisp.net/project/yason"
SRC_URI="https://github.com/hanshuebner/yason/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/trivial-gray-streams"

