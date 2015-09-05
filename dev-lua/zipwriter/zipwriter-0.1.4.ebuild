# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Library for creating ZIP archive"
HOMEPAGE="https://github.com/moteus/ZipWriter"
SRC_URI="https://github.com/moteus/ZipWriter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/lzlib
dev-lua/struct
"

src_install() {
	lua_install_module -r lua/{ZipWriter,ZipWriter.lua}
	dodoc README.md
}
