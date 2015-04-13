# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="RFC 3986 percent-encoding library"
HOMEPAGE="https://github.com/llibra/percent-encoding"
SRC_URI=""

EGIT_SRC_URI="https://github.com/llibra/percent-encoding.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/anaphora
dev-lisp/babel"

