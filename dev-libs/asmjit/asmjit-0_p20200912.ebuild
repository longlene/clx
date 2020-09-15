# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="5bc166efdb419f88bd5b5774c62cfc4d08a0bfa4"

DESCRIPTION="Machine code generation for C++"
HOMEPAGE="https://github.com/asmjit/asmjit"
SRC_URI="https://github.com/asmjit/asmjit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
