# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 lua

DESCRIPTION="lua binding to libui library"
HOMEPAGE="https://github.com/mdombroski/libui-lua"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mdombroski/libui-lua.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="x11-libs/libui"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	lua_version
	sed -i "s#5.3.3#${LUAVER}#" Makefile
}

src_install() {
	lua_install_cmodule -r libui
	dodoc README.md
}
