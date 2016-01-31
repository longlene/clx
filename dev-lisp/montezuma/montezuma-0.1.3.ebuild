# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Full-text search engine in Common Lisp"
HOMEPAGE="https://github.com/skypher/montezuma http://code.google.com/p/montezuma/"
SRC_URI="mirror://github/skypher/montezuma/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/cl-fad
dev-lisp/babel"

