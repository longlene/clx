# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Ravi Programming Language"
HOMEPAGE="https://github.com/dibyendumajumdar/ravi"
SRC_URI="https://github.com/dibyendumajumdar/ravi/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static"

DEPEND="
	llvm? ( sys-devel/llvm )
	gcc? ( sys-devel/gcc )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DLLVM_JIT=$(usex llvm)
	-DGCC_JIT=$(usex gcc)
	-DSTATIC_BUILD=$(usex static)
	)
	cmake-utils_src_configure
}


