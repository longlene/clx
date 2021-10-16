# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="d0d14ac774977d0060a351f66e35cb57ba0bf59c"

DESCRIPTION="Machine code generation for C++"
HOMEPAGE="https://github.com/asmjit/asmjit"
SRC_URI="https://github.com/asmjit/asmjit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
