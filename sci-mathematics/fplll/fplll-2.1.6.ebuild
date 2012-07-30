# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="different implementations of the floating-point LLL reduction algorithm"
HOMEPAGE="http://perso.ens-lyon.fr/damien.stehle/english.html"
SRC_URI="http://perso.ens-lyon.fr/damien.stehle/downloads/${P}.tgz"

RESTRICT="mirror"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""
S="${PN}-2.1"

DEPEND=">=dev-libs/gmp-4.2.1
	>=dev-libs/mpfr-2.1.1"
RDEPEND="${DEPEND}"

src_compile(){
	cd "${S}"
#	sage puts the header in a fplll subfolder, there are 2 reasons 
#	to do it on our side. (1) compatibility, no need for patching.
#	(2) it avoids a collision with libm4ri. (matrix.h)
	econf "--includedir=/usr/include/fplll"  || die "configure failed"

	emake || die "make failed"
}

src_install() {
	cd "${S}"
    emake DESTDIR="${D}" install || die "Install failed"
#	it install strange headers???? check with upstream.
    dodoc README
}

