inherit toolchain-funcs

DESCRIPTION="Scan for LLTD-enabled hosts on your network"
HOMEPAGE="http://github.com/zed-0xff/lltdscan"
SRC_URI="http://cloud.github.com/downloads/zed-0xff/lltdscan/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-libs/libpcap
	>=net-libs/libnet-1.1.0-r3"

src_unpack() {
	unpack ${A}
	cd "${S}"
	rm -f Makefile
}

src_compile() {
	emake \
		CC=$(tc-getCC) \
		LDLIBS="-lpcap -lnet -lrt" \
		lltdscan \
		|| die
}

src_install() {
	dosbin lltdscan
	doman lltdscan.8
	dodoc README
}
