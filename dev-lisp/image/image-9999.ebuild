# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-r3

DESCRIPTION="An image-drawing with some drawing primitives"
HOMEPAGE="https://github.com/kevinlynx/image"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kevinlynx/image.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/skippy
dev-lisp/zpng
dev-lisp/gzip-stream
dev-lisp/flexi-streams"

