# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp CFFI bindings for the Chipmunk Physics library"
HOMEPAGE="https://github.com/orthecreedence/clipmunk"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/clipmunk.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-games/chipmunk"

