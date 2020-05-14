# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2cd461db542a48bf9c92388bb3a0fcafb80dfd15"

DESCRIPTION="A collection of Common Lisp utilities"
HOMEPAGE="https://github.com/svenvc/s-utils"
SRC_URI="https://github.com/svenvc/s-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

