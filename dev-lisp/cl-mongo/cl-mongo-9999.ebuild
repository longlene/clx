# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-2 git-2
DESCRIPTION="Common Lisp interface to MongoDB"
HOMEPAGE="http://fons.github.com/cl-mongo"
SRC_URI=""

EGIT_REPO_URI="git://github.com/fons/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/uuid
		dev-lisp/babel
		dev-lisp/bordeaux-threads
		dev-lisp/documentation-template
		dev-lisp/lisp-unit
		dev-lisp/parenscript
		dev-lisp/split-sequence
		dev-lisp/usocket
		dev-db/mongodb"


src_install() {
	common-lisp-install ${PN}.asd src test.lisp

	common-lisp-symlink-asdf

	dodoc doc/{index.html,READ.md,readme-base.md} README.md
}
