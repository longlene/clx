# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Direct FFI bindings for OpenGL window and context management"
HOMEPAGE="https://github.com/patzy/glop"
SRC_URI=""

EGIT_REPO_URI="https://github.com/patzy/glop.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	virtual/opengl
"

src_prepare() {
	use test || rm -rf test ${PN}-test.asd
}
