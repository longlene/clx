# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="a binding to WebKitGtk+ for Common Lisp"
HOMEPAGE="https://github.com/AeroNotix/cl-webkit"
SRC_URI="mirror://github/joachifm/cl-webkit/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
net-libs/webkit-gtk
dev-lisp/cffi"

