# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit eutils subversion

DESCRIPTION=" The game programming language"
HOMEPAGE="http://www.bennugd.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

ESVN_REPO_URI="https://${PN}.svn.sourceforge.net/svnroot/${PN}"
ESVN_PROJECT="${PN}"                                                                                                                                                                                      
                                                                                                                                                                                                          
RDEPEND="
	media-libs/libsdl
	media-libs/sdl-mixer
	media-libs/libpng
	media-libs/smpeg
	media-libs/libogg
"
DEPEND="${RDEPEND}"

src_compile() {
        cd ${S}/core
	chmod +x ./configure
	econf                                                                                                                                                                                         
	emake || die "emake failed"

	cd ${S}/modules
	chmod +x ./configure
	econf
	emake || die "emake failed"
}

src_install() {
        cd ${S}/core
	emake DESTDIR="${D}" install || die "emake install failed"

        cd ${S}/modules
	emake DESTDIR="${D}" install || die "emake install failed"
}
