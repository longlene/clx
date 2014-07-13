# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="Mach-O loader for Linux"
HOMEPAGE="https://github.com/shinh/maloader"
SRC_URI=""
EGIT_SRC_URI="https://github.com/shinh/maloader.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cxx"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/opencflite
cxx? ( sys-devel/libcxx )"

src_compile() {
	local option = ""
	use cxx && option=USE_LIBCXX=1
	emake ${option}
}
