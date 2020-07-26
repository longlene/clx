# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="An HTTP protocol parser in Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/http-parse"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/http-parse.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/babel
dev-lisp/cl-ppcre"

