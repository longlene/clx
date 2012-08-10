DESCRIPTION="A pre-kernel/VMM module that uses Intel(R) TXT to perform a measured and verified launch of an OS kernel/VMM."
HOMEPAGE="http://tboot.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="app-crypt/trousers"

LDFLAGS=""

src_compile() {
    emake || die
}

src_install() {
    emake debug=y DISTDIR="${D}" install || die

    dodoc COPYING README CHANGELOG  || die
    dodoc docs/policy_v1.txt docs/policy_v2.txt docs/txt-info.txt || die
    dodoc lcptools/lcptools2.txt lcptools/Linux_LCP_Tools_User_Manual.pdf || die
}

pkg_postinst() {
    ewarn "Please remeber to download the SINIT AC Module relevant"
    ewarn "for your platform from:"
    ewarn "http://software.intel.com/en-us/articles/intel-trusted-execution-technology/"
}

