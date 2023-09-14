# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ef3c16cefa80eacce9129ff98f751b8f6f19c237"

DESCRIPTION="Anonymous function helpers for Common Lisp"
HOMEPAGE="https://github.com/arielnetworks/cl-anonfun"
SRC_URI="https://github.com/arielnetworks/cl-anonfun/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

