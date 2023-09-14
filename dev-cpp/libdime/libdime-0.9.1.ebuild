# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_P="accdb2d6152a"
DESCRIPTION="Dime library for manage dxf files"
HOMEPAGE="http://www.coin3d.org/lib/dime/"
SRC_URI="http://hg.sim.no/dime/default/archive/accdb2d6152a.tar.bz2"
#SRC_URI="http://hg.sim.no/dime/default/archive/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/default-${MY_P}
RESTRICT="mirror"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog COPYING NEWS README FAQ TODO docs/announcement-0_9.txt || die "Documentation files failed"
}
