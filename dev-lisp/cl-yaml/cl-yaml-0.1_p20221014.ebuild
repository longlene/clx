# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="12c84d43b3f57f332774c780a2e4a20eee7f47de"

DESCRIPTION="A YAML parser and emitter"
HOMEPAGE="https://github.com/eudoxia0/cl-yaml"
SRC_URI="https://github.com/eudoxia0/cl-yaml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-libyaml
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/parse-number
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install sources -t all README.md
}

