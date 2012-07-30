EAPI="3"
PYTHON_DEPEND="python? 2"

inherit eutils cmake-utils

MY_PV=${PV/_p*}
MY_P=${PN}-${MY_PV}
PLEVEL=${PV/*p}
DESCRIPTION="A C++ JSON Parser/Generator Implemented with Boost Spirit"
HOMEPAGE="http://www.codeproject.com/KB/recipes/JSON_Spirit.aspx"
SRC_URI="http://www.codeproject.com/KB/recipes/JSON_Spirit/json_spirit_v4_04.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~ppc-aix ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.40.0
	>=dev-util/cmake-2.8.1-r2"

S=${WORKDIR}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
