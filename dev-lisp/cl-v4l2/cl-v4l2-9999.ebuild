# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3
DESCRIPTION="Common Lisp bindings for Video4Linux2"
HOMEPAGE="http://repo.or.cz/w/cl-v4l2.git"
SRC_URI=""

EGIT_REPO_URI="http://repo.or.cz/w/cl-v4l2.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iolib
dev-lisp/trivial-garbage
dev-lisp/closer-mop"


src_install() {
	common-lisp-install *.{asd,lisp}
	common-lisp-symlink-asdf
}
