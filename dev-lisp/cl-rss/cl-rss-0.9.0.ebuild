# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="a Common Lisp library for fetching and parsing Remote Site Summary data via HTTP"
HOMEPAGE="http://files.b9.com/cl-rss/"
SRC_URI="http://files.b9.com/cl-rss/cl-rss-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/kmrcl
dev-lisp/xmls
dev-lisp/aserve"

