# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="argv parsing"
HOMEPAGE="https://github.com/pve1/apply-argv"
SRC_URI="https://github.com/pve1/apply-argv/archive/v${PV}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria"

