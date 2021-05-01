# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="XML Stream PAttern Matcher - concise, regexp-like pattern matching on streaming XML"
HOMEPAGE="http://common-lisp.net/project/cl-xmlspam/"
SRC_URI="https://mydebian.googlecode.com/files/${P}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cxml
dev-lisp/cl-ppcre"

