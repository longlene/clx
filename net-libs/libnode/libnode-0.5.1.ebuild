# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

DESCRIPTION="libnode is a C++ implementation of Node.js"
HOMEPAGE="https://github.com/plenluno/libnode"
SRC_URI="https://github.com/plenluno/libnode/archive/libnode-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${PN}-${P}"
