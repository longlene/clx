# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/fceultra/fceultra-0.98.12.ebuild,v 1.7 2007/08/13 16:52:11 mr_bones_ Exp $

EAPI=2
inherit eutils games python

MY_PN="mfe"
DESCRIPTION="A portable NES/Famicom emulator"
HOMEPAGE="http://sourceforge.net/projects/mednafenfe/"
SRC_URI="http://downloads.sourceforge.net/${PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/python-2.5
	>=x11-libs/gtk+-2.10
	dev-python/pygtk"
DEPEND="${RDEPEND}
	dev-python/configobj"

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	einfo "Fixing hardcoded paths..."
	sed -i 	-e "s:/usr/share/mfe:${D}${GAMES_DATADIR}/${MY_PN}:" \
		-e "s:/usr/share/pixmaps:${D}${GAMES_DATADIR_BASE}/pixmaps:" \
		-e "s:/usr/share/applications:${D}${GAMES_DATADIR_BASE}/applications:" setup.py || die

	sed -i 	-e "s:\"/usr/games/mednafen\":\"${GAMES_BINDIR}/mednafen\":g" \
		-e "s:\"/usr/share/mfe\":\"${GAMES_DATADIR}/${MY_PN}\":g" mfe/mfeconst.py || die
}

src_install() {
	./setup.py install --prefix="${D}/usr" || die "make install failed"
	dodoc README TODO debian/changelog || die "death from clumsy docs"
	prepgamesdirs
}
