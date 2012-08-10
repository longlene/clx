EAPI="3"
PYTHON_DEPEND='2'
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Extract files from captured TCP sessions. Support live streams and pcap files."
HOMEPAGE="https://www.abnorm.org/projects/tcpextract/"
SRC_URI="https://github.com/faust/tcpextract/downloads/${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="dev-python/pynids"

DOCS="README.rst CHANGELOG.txt"

