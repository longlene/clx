# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="RetDec is a retargetable machine-code decompiler based on LLVM"
HOMEPAGE="https://retdec.com/"
SRC_URI="https://github.com/avast-tl/retdec/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-libs/ncurses[tinfo]
"
RDEPEND="${DEPEND}"
