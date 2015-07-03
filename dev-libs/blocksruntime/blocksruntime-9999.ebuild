# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="the BlocksRuntime library"
HOMEPAGE="https://github.com/mackyle/blocksruntime"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mackyle/blocksruntime.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	#cd ${S} && ./buildlib > /dev/null
	./buildlib > /dev/null
}

src_install() {
	local dest="/usr/include/compiler-rt"
	insinto ${dest}
	doins BlocksRuntime/Block.h
	doins BlocksRuntime/Block_private.h

	dolib.a libBlocksRuntime.a
}
