# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="A bridge between Common Lisp and GObject"
HOMEPAGE="https://github.com/andy128k/cl-gobject-introspection"
SRC_URI=""

EGIT_REPO_URI="https://github.com/andy128k/cl-gobject-introspection.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iterate"

