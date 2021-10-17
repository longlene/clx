# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="f1adac7b837850cc0783c44ed5a9a91001b334aa"

DESCRIPTION="A class system for Lua"
HOMEPAGE="https://github.com/deepmind/classic"
SRC_URI="https://github.com/deepmind/classic/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	dev-lua/torch-totem
"

DOCS=( README.md )

each_lua_install() {
	dolua classic
}
