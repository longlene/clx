# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="a4dd0b2d8b0fdbcda777e4d6dae0e76636080113"

DESCRIPTION="Machine code generation for C++"
HOMEPAGE="https://github.com/asmjit/asmjit"
SRC_URI="https://github.com/asmjit/asmjit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
