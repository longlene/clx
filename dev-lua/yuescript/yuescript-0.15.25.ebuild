# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit cmake lua-single vcs-snapshot

DESCRIPTION="Yuescript is a Moonscript dialect"
HOMEPAGE="https://github.com/pigpigyyy/Yuescript"
SRC_URI="https://github.com/pigpigyyy/Yuescript/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/lua
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${BUILD_DIR}/yue
	einstalldocs
}
