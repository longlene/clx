# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Reasonable Utilities package for Common Lisp"
HOMEPAGE="https://github.com/mabragor/rutils"
SRC_URI="https://github.com/vseloved/rutils/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/named-readtables
dev-lisp/defmacro-enhance"

