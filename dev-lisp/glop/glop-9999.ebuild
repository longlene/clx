# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Direct FFI bindings for OpenGL window and context management"
HOMEPAGE="https://github.com/patzy/glop"

EGIT_REPO_URI="https://github.com/patzy/glop.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="${DEPEND}
	dev-lisp/cffi
	virtual/opengl
"

src_prepare() {
	use test || rm -rf test ${PN}-test.asd
}
