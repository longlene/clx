# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="A D-BUS client library for Common Lisp"
HOMEPAGE="https://github.com/death/dbus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/death/dbus.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/babel
dev-lisp/cl-xmlspam
dev-lisp/flexi-streams
dev-lisp/iolib
dev-lisp/ironclad
dev-lisp/split-sequence"

