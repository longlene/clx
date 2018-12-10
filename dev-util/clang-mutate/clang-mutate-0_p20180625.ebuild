# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="a775e37b662454bfb8fac6ce0832009a59a6504c"

DESCRIPTION="Manipulate C-family ASTs with Clang"
HOMEPAGE="https://github.com/GrammaTech/clang-mutate"
SRC_URI="https://github.com/GrammaTech/clang-mutate/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-devel/llvm
	sys-libs/ncurses[tinfo]
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_install() {
	dobin clang-mutate
	dodoc README.md
}
