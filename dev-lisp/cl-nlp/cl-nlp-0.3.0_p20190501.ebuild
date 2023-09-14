# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f180b6c3c0b9a3614ae43f53a11bc500767307d0"

DESCRIPTION="Lisp NLP tool-set"
HOMEPAGE="https://github.com/vseloved/cl-nlp"
SRC_URI="https://github.com/vseloved/cl-nlp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/archive
	dev-lisp/chipz
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
	dev-lisp/cgn
	dev-lisp/closer-mop
	dev-lisp/clsql[sqlite]
	dev-lisp/cxml
	dev-lisp/drakma
	dev-lisp/flexi-streams
	dev-lisp/gzip-stream
	dev-lisp/mgl-mat
	>dev-lisp/rutils-2.5.0
	dev-lisp/zip
"


src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}

