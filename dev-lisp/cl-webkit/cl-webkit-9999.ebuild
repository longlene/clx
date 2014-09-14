# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 common-lisp-3

DESCRIPTION="a binding to WebKitGtk+ for Common Lisp"
HOMEPAGE="https://github.com/AeroNotix/cl-webkit"
SRC_URI=""

EGIT_REPO_URI="https://github.com/AeroNotix/cl-webkit.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
net-libs/webkit-gtk
dev-lisp/cffi"

