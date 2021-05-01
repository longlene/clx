# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A CFFI based interface to the PLplot scientific plotting library"
HOMEPAGE="http://common-lisp.net/project/cl-plplot/"
SRC_URI="http://common-lisp.net/project/cl-plplot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/asdf
dev-lisp/cffi
sci-libs/plplot"

