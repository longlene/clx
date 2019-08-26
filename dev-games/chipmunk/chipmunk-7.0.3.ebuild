# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A fast and lightweight 2D game physics library"
HOMEPAGE="https://github.com/slembcke/Chipmunk-Physics http://chipmunk-physics.net/"
SRC_URI="https://github.com/slembcke/Chipmunk-Physics/archive/Chipmunk-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
x11-libs/libXmu
media-libs/freeglut"


S="${WORKDIR}/Chipmunk-Physics-Chipmunk-${PV}"
