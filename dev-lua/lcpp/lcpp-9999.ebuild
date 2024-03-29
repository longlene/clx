# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3

DESCRIPTION="A Lua C PreProcessor"
HOMEPAGE="https://github.com/willsteel/lcpp"
SRC_URI=""
EGIT_REPO_URI="https://github.com/willsteel/lcpp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto $(pkg-config --variable INSTALL_CMOD lua)
	doins lcpp.lua
}
