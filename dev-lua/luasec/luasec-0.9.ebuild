# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="LuaSec"
HOMEPAGE="https://github.com/brunoos/luasec"
SRC_URI="https://github.com/brunoos/luasec/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
"
BDEPEND=""
