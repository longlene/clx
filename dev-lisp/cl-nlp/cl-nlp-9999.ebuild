# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="Lisp NLP tool-set"
HOMEPAGE="https://github.com/vseloved/cl-nlp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vseloved/cl-nlp.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/archive
	dev-lisp/chipz
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
	dev-lisp/cxml
	dev-lisp/drakma
	dev-lisp/flexi-streams
	dev-lisp/gzip-stream
	>dev-lisp/rutils-2.5.0
	dev-lisp/should-test
	dev-lisp/zip
"


src_install() {
	common-lisp-install-sources -t all src nltk contrib data *.asd
}

