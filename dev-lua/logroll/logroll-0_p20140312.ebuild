# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="80e1ae7834345a7008fc0f09a270770469daf332"

DESCRIPTION="A basic logging library for Lua and Torch"
HOMEPAGE="https://github.com/rosejn/logroll"
SRC_URI="https://github.com/rosejn/logroll/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r logroll
	dodoc README.md
}
