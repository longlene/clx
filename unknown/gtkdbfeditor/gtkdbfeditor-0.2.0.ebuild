DESCRIPTION="simple editor for DBF files built with GTK+"
HOMEPAGE="http://gtkdbfeditor.sourceforge.net"
SRC_URI="mirror://sourceforge/gtkdbfeditor/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="x86"
IUSE=""

RDEPEND="=x11-libs/gtk+-1.2*"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
  econf || die "could not configure"
  emake || die "emake failed"
}

src_install() {
    einstall || die "einstall failed"
	dodoc AUTHORS ChangeLog COPYING README
}
