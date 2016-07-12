# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="C++11 libuv wrapper"
HOMEPAGE="https://github.com/larroy/uvpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/larroy/uvpp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libuv
"

src_install() {
	insinto /usr/include
	doins *.hpp
	dodoc README.md
}
