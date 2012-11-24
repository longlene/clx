# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3
DESCRIPTION="uri-template is an implementation of the URI Template."
HOMEPAGE="http://common-lisp.net/project/uri-template/"
SRC_URI="http://common-lisp.net/project/uri-template/release/uri-template-1.3.tgz"

LICENSE="LLGPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/named-readtables
dev-lisp/flexi-streams"

