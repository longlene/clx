# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="A Common Lisp editor"
HOMEPAGE="http://common-lisp.net/project/able/"
SRC_URI="http://common-lisp.net/project/able/files/able-${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/ltk
dev-lisp/trivial-gray-stream
dev-lisp/cl-fad"

