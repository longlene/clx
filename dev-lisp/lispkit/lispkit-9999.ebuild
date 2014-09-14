# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 common-lisp-3

DESCRIPTION="A lisp browser using WebKit"
HOMEPAGE="http://github.com/AeroNotix/lispkit"
SRC_URI=""
EGIT_REPO_URI="https://github.com/AeroNotix/lispkit.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-cffi-gtk
dev-lisp/cl-webkit
dev-lisp/purl
dev-lisp/cl-xkeysym
dev-lisp/split-sequence
test? ( dev-lisp/lisp-unit dev-lisp/alexandria )"

