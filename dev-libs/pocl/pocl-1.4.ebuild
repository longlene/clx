EAPI="6"
inherit cmake-utils cmake-multilib

DESCRIPTION="Portable Computing Language"
HOMEPAGE="http://portablecl.org"
SRC_URI="http://github.com/pocl/pocl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	>=sys-devel/llvm-3.9
	sys-devel/clang
	sys-apps/hwloc
"

DEPEND="${RDEPEND}"

PATCHES=("${FILESDIR}/vendor_opencl_libs_location.epatch"
)
