# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Markdown for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/markdown.cl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/markdown.cl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/xmls
dev-lisp/cl-ppcre"

CLPACKAGE="markdown.cl"
