# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4d3e6d118aa14bbdab732bfd8fa6dfe2ff993369"

DESCRIPTION="The collection of simple functions for CommonLisp"
HOMEPAGE="https://github.com/byulparan/simple-utils"
SRC_URI="https://github.com/byulparan/Simple-Utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

