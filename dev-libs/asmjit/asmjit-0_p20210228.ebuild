# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="a305905d320a177c22636bee4842efb60d5e1994"

DESCRIPTION="Machine code generation for C++"
HOMEPAGE="https://github.com/asmjit/asmjit"
SRC_URI="https://github.com/asmjit/asmjit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
