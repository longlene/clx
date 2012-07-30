# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games subversion

ESVN_REPO_URI="https://garage.maemo.org/svn/numptyphysics/trunk"
if [[ "$PV" != "9999" ]] ; then
	ESVN_REVISION="$PV"
fi

DESCRIPTION="Numpty Physics is a drawing puzzle game in the spirit of Crayon Physics using the same excellent Box2D engine"
HOMEPAGE="http://numptyphysics.garage.maemo.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="media-libs/libsdl
		media-libs/sdl-image[png]
		media-libs/sdl-ttf
		x11-libs/libX11
		sys-libs/zlib"

DEPEND="${RDEPEND}"

src_prepare() {
	# fix location
	sed -i Config.h \
		-e 's:/usr/share/numptyphysics:/usr/share/games/numptyphysics:' \
		|| die 'sed failed'
	sed -i data/numptyphysics.desktop \
		-e 's:Exec=/usr/bin.*:Exec=numptyphysics:' \
		|| die 'sed failed'
}

src_configure() {
	egamesconf --disable-hildon || die "egamesconf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	mv "${D}"/usr/share/games/icons "${D}"/usr/share/ || die "move failed"
}

pkg_preinst() {
	subversion_pkg_preinst
	games_pkg_preinst
}
