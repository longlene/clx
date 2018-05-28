# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="A lua library for time and date manipulation"
HOMEPAGE="https://github.com/daurnimator/luatz"
SRC_URI="https://github.com/daurnimator/luatz/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r luatz
	dodoc README.md
}
