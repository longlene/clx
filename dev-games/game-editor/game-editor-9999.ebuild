# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games multilib subversion

DESCRIPTION="2D Game editor"
HOMEPAGE="http://game-editor.com"
ESVN_REPO_URI="https://game-editor.svn.sourceforge.net/svnroot/game-editor/trunk"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libXext
	x11-libs/libxcb"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s:lib32:$(get_libdir):" gameEditor/makefile.editor || die
	sed -i -e "s:functions.xml:${GAMES_DATADIR}/${PN}/functions.xml:" gameEditor/FunctionPanel.cpp || die
	sed -i -e "s:b_xy.png:${GAMES_DATADIR}/${PN}/b_xy.png:" gameEngine/EditBox.cpp || die
	sed -i -e "s:editor.dat:${GAMES_DATADIR}/${PN}/editor.dat:" gameEngine/GameControl.cpp || die
	sed -i -e "s:config.xml:${GAMES_DATADIR}/${PN}/config.xml:" wxGameEditor/Behavior/wxJigsawEditor/wxJigsawEditorMainFrame.cpp || die
}

src_install() {
	insinto "${GAMES_DATADIR}/${PN}"
	doins gameEditor/res/* || die
	dogamesbin  output/editor/gameEditor || die
	prepgamesdirs
}
