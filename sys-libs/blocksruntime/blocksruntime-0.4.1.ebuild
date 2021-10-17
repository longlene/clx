# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools vcs-snapshot

DESCRIPTION="the BlocksRuntime library"
HOMEPAGE="https://github.com/mackyle/blocksruntime"
SRC_URI="https://github.com/mheily/blocks-runtime/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

#src_install() {
#	local dest="/usr/include/compiler-rt"
#	insinto ${dest}
#	doins BlocksRuntime/Block.h
#	doins BlocksRuntime/Block_private.h
#
#	dolib.a libBlocksRuntime.a
#}
