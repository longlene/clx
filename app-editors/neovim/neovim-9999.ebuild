# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-2

DESCRIPTION=""
HOMEPAGE="http://neovim.org/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/neovim/neovim.git"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua-lpeg
dev-lua/lua-MessagePack
dev-libs/libuv"
