# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="Static Blog Generator"
HOMEPAGE="https://github.com/Liutos/cl-github-page"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Liutos/cl-github-page.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-fad
dev-lisp/cl-markdown
dev-lisp/cl-who
dev-lisp/html-template
dev-lisp/local-time"

src_install() {
	common-lisp-install-sources src/
	common-lisp-install-sources -t all tmpl
	common-lisp-install-asdf
}

