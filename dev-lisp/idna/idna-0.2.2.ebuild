# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="Common Lisp IDNA encding/decoding functions"
HOMEPAGE="https://github.com/antifuchs/idna"
SRC_URI="mirror://github/antifuchs/idna/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/split-sequence"

