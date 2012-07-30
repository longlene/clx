DESCRIPTION="Virtual Router Redundancy Protocol Deamon"
HOMEPAGE="http://www.sourceforge.net/projects/vrrpd"
SRC_URI="mirror://sourceforge/vrrpd/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

src_compile() {
	emake
}

src_install() {
	dosbin vrrpd
	doman vrrpd.8
	dodoc FAQ Changes TODO scott_example doc/draft-ietf-vrrp-spec-v2-05.txt doc/rfc2338.txt.vrrp doc/draft-jou-duplicate-ip-address-02.txt
}
