# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2 java-ant-2 vcs-snapshot

EGIT_COMMIT="6f10cd6910e466935b129585e57f35f537fe795f"

DESCRIPTION="A free J2ME emulator with libretro, awt, sdl2 and javafx frontends"
HOMEPAGE="https://github.com/hex007/freej2me"
SRC_URI="https://github.com/hex007/freej2me/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jre-1.7"
RDEPEND="
	>=virtual/jre-1.7
	${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/Building\ JAR\ -\ JavaFx/,/<\/jar>/d' build.xml
	rm src/org/recompile/freej2me/JavaFx.java
}

src_compile() {
	java-pkg_gen-cp EANT_GENTOO_CLASSPATH
	eant
	#emake -C src/sdl2
}


src_install() {
	java-pkg_dojar build/freej2me{,-lr,-sdl}.jar 
	dodoc README.md
}
