DESCRIPTION="Free Xilinx programmer"
HOMEPAGE="http://xilprg.sourceforge.net/"
SRC_URI="mirror://sourceforge/xilprg/xilprg-${PV}-src.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86"

RDEPEND="libusb"
DEPEND="libusb"

S="${WORKDIR}/xilprg-${PV}"

src_unpack () {
	unpack "${A}"
	cd "${S}"
	sed -ie "s:xilprg.conf:/etc/xilprg.conf:" src/xilprg.cpp
}


src_compile() {
	make CPFLAGS="$CFLAGS" || die
}

src_install() {
	into /usr
	dobin obj/linux/xilprg
	dodoc readme.txt
	insinto /etc/
	doins xilprg.conf
}
