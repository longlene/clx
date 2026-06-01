# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="XML Stream PAttern Matcher - concise, regexp-like pattern matching on"
HOMEPAGE="http://common-lisp.net/project/cl-xmlspam/"
SRC_URI="https://mydebian.googlecode.com/files/${P}.tgz"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/cxml
dev-lisp/cl-ppcre"
