# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="High performance memory-mapped database and serialization library for Common Lisp"
HOMEPAGE="https://github.com/cosmos72/hyperluminal-db"
SRC_URI="mirror://github/cosmos72/hyperluminal-db/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/log4cl
dev-lisp/cffi
dev-lisp/osicat
dev-lisp/bordeaux-threads
dev-lisp/stmx
dev-lisp/trivial-garbage"
