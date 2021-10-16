# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake git-r3

EGIT_COMMIT="9ada8546fdb619d58dae5d3f5114348d0bcc87d1"

DESCRIPTION="C/C++ language server supporting multi-million line code base"
HOMEPAGE="https://github.com/cquery-project/cquery"
EGIT_REPO_URI="https://github.com/cquery-project/cquery.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/clang"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DSYSTEM_CLANG=ON
	-DCLANG_ROOT=/usr/lib/llvm/6
	)
	cmake_src_configure
}
