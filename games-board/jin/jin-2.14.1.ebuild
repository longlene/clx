# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2 java-ant-2 games

DESCRIPTION="Java client for various chess servers."
HOMEPAGE="http://www.jinchess.com"
SRC_URI="mirror://sourceforge/${PN}/${P}-source.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="|| (
		=virtual/jdk-1.4*
		=virtual/jdk-1.5*
		)
		dev-java/ant"
RDEPEND=">=virtual/jre-1.4"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Edit the startup script so it points to the install location
	sed -i \
		-e "s@cd \`dirname \$filename\`@cd ${GAMES_DATADIR}/${PN}@" \
		resources/os-specific/unix/jin || die "sed failed"
}

src_compile() {
	eant || die "eant failed"
}

src_install() {
	dogamesbin build/jin

	insinto $GAMES_DATADIR/${PN}
	doins -r build/* || die "doins failed"

	prepgamesdirs
}

