DESCRIPTION="command line tool to manipulate the multicast routes of the Linux kernel"
SRC_URI="http://www.cschill.de/smcroute/${P}.tgz"
HOMEPAGE="http://www.cschill.de/smcroute/"
KEYWORDS="x86"
LICENSE="GPL"
SLOT="0"
DEPEND=""
RDEPEND=""
IUSE=""

src_unpack() {
 unpack ${A}
 cd "${S}"
}

src_compile() { 
 cd src
 emake
}

src_install() {
    cd "${S}"
	dosbin bin/mcsender bin/smcroute
	doman doc/smcroute.8
	dodoc ChangeLog.txt GPL.txt 
}
