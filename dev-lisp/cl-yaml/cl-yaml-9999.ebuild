# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A YAML parser and emitter"
HOMEPAGE="https://github.com/eudoxia0/cl-yaml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/cl-yaml.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-libyaml
dev-lisp/alexandria
dev-lisp/cl-ppcre
dev-lisp/parse-number
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install sources -t all README.md
}

