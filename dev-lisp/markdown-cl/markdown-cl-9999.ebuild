# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Markdown for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/markdown.cl"

EGIT_REPO_URI="https://github.com/orthecreedence/markdown.cl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/xmls
dev-lisp/cl-ppcre"

CLPACKAGE="markdown.cl"
