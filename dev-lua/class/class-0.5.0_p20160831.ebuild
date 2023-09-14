# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="e2e4cd24aad5c707e42481367eb8de30f437df0f"

DESCRIPTION="Oriented Object Programming for Lua"
HOMEPAGE="https://github.com/torch/class"
SRC_URI="https://github.com/torch/class/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/argcheck
"

DOCS=( README.md )

each_lua_install() {
	insinto $(lua_get_lmoddir)/class
	doins init.lua
}
