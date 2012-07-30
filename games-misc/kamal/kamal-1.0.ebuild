# Kamal ebuild

DESCRIPTION="A platformer where you can shift the world to solve puzzles"
HOMEPAGE="http://dimensionalrift.homelinux.net/"
SRC_URI="http://dimensionalrift.homelinux.net/downloads/combuster/${P}.tar.bz2"

LICENSE="CCPL-Attribution-NonCommercial-NoDerivs-2.5"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
EAPI="2"

RDEPEND="media-libs/libsdl[opengl]
    media-libs/libpng"
DEPEND=${RDEPEND}

src_compile() {
    emake || die
}

src_install() {
    exeinto /usr/games/bin/
    insopts -g games -m750
    exeopts -g games -m750
    doexe kamal
    
    dodir /usr/share/games/kamal
    insinto /usr/share/games/kamal   
    
    doins *.bmp
    doins *.png
    doins *.adx
    doins *.lvl
    
    dodir /usr/share/games/kamal/audio
    insinto /usr/share/games/kamal/audio
    doins audio/*.wav    
}
