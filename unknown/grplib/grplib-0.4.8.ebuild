DESCRIPTION="game library directly supporting Blizzard's GRP format (8-bit sprites) used in StarCraft and Diablo II games"
HOMEPAGE="http://www.sourceforge.net/projects/grplib"
SRC_URI="mirror://sourceforge/grplib/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="x86"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
  econf || die "econf failed"
  emake || die "emake failed"
}

src_install() {
    einstall || die "einstall failed"
	dodoc ChangeLog COPYING README
    cp -R docs ${D}/usr/share/doc/${PF}
}
