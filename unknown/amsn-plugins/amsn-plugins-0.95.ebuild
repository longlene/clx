# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/amsn-skins/amsn-skins-20040223.ebuild,v 1.9 2005/09/17 10:12:30 agriffis Exp $

S=${WORKDIR}
DESCRIPTION="Collection of AMSN plugins"
HOMEPAGE="http://amsn.sourceforge.net/"
PLUGIN_URI="mirror://sourceforge/amsn/"
SRC_URI="${PLUGIN_URI}/amsnplus-2.6.zip
	${PLUGIN_URI}/colorize-1.0.zip
	${PLUGIN_URI}/dbusviewer-0.1.zip
	${PLUGIN_URI}/desktop_integration-0.9.zip
	${PLUGIN_URI}/emotes-0.1.zip
	${PLUGIN_URI}/fakingit-b2.zip
	${PLUGIN_URI}/gename-1.0.zip
	${PLUGIN_URI}/glogs-1.0.zip
	${PLUGIN_URI}/Invisibility-b1.zip
	${PLUGIN_URI}/movewin-0.1.zip
	${PLUGIN_URI}/music-1.3.zip
	${PLUGIN_URI}/pop3-2.2.zip
	${PLUGIN_URI}/remind-1.2.zip
	${PLUGIN_URI}/sayit-1.3.zip
	${PLUGIN_URI}/TeXIM-0.7.zip
	${PLUGIN_URI}/whatis-1.2.zip
	${PLUGIN_URI}/winskin-0.11.zip"

RESTRICT="nomirror"
SLOT="0"
LICENSE="freedist"
KEYWORDS="alpha amd64 ppc ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="net-im/amsn"

src_install () {
	dodir /usr/share/amsn/plugins
	cp -r ${S}/* ${D}/usr/share/amsn/plugins
}
