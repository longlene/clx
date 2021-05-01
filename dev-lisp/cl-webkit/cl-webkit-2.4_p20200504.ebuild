# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f93cb9697e8813068795fe4dc39ac950d814102d"

DESCRIPTION="A binding to WebKitGtk+ for Common Lisp"
HOMEPAGE="https://github.com/next-browser/cl-webkit"
SRC_URI="https://github.com/next-browser/cl-webkit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-cffi-gtk
	net-libs/webkit-gtk
"

