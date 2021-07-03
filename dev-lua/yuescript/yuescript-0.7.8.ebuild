# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils lua-utils vcs-snapshot

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
	insinto $(lua_get_cmod_dir)
	doins ${BUILD_DIR}/yue.so
	dobin ${BUILD_DIR}/yue
	dodoc README.md
}
