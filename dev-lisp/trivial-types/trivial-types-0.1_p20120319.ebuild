# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ee869f2b7504d8aa9a74403641a5b42b16f47d88"

DESCRIPTION="Trivial type definitions for Common Lisp"
HOMEPAGE="https://github.com/m2ym/trivial-types"
SRC_URI="https://github.com/m2ym/trivial-types/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

