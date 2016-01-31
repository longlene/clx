EAPI=4

inherit webapp eutils

DESCRIPTION="Managing and defining user sessions is even easier via the new NX Builder. With just one click users can access their already configured NX sessions."
HOMEPAGE="http://www.nomachine.com/"

# package version without patch level (e.g. 3.3.0)
MY_PV_M="${PV%%_p*}"

# package version with patch level (e.g. 3.3.0-1)
MY_PV_P="${PV//_p/-}"

SRC_URI="http://64.34.161.181/download/${MY_PV_M}/Linux/nxbuilder-${MY_PV_P}.tar.gz"
LICENSE="nomachine"
#KEYWORDS="~amd64 ~x86"
KEYWORDS="~x86"
IUSE=""
RESTRICT="mirror"

DEPEND=">=net-misc/nxserver-freeedition-3.3.0
	dev-lang/php[mysql]"


src_install() {
	webapp_src_preinst

	cp -R nxbuilder/* ${D}/${MY_HTDOCSDIR}

	webapp_src_install
}
