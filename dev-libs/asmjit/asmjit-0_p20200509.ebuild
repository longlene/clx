# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="e78bba83da7fed4d8d3d5ed87cd23d64d9fcbb55"

DESCRIPTION="Complete x86/x64 JIT and Remote Assembler for C++"
HOMEPAGE="https://github.com/asmjit/asmjit"
SRC_URI="https://github.com/asmjit/asmjit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
