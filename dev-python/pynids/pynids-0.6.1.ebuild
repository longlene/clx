EAPI="3"
PYTHON_DEPEND='2'
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Python bindings for libnids."
HOMEPAGE="http://jon.oberheide.org/pynids/"
SRC_URI="http://jon.oberheide.org/pynids/downloads/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="net-libs/libnet
	net-libs/libpcap"

DOCS="CHANGES Example README"
