# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="An extensible and high level FFI"
HOMEPAGE="https://github.com/Lovesan/virgil"
SRC_URI="https://github.com/Lovesan/virgil/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/trivial-features
dev-lisp/cffi
dev-lisp/alexandria
dev-lisp/babel"

