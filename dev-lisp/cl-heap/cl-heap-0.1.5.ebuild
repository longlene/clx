# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3

DESCRIPTION="An implementation of heap and priority queue data structures"
HOMEPAGE="https://github.com/TheRiver/CL-HEAP"
SRC_URI="mirror://github/TheRiver/CL-HEAP/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

