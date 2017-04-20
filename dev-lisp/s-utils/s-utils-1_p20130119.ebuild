# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1020ab666b719d171947d28ad1c5265f9c4932a4"

DESCRIPTION="A collection of Common Lisp utilities"
HOMEPAGE="https://github.com/svenvc/s-utils"
SRC_URI="https://github.com/svenvc/s-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

