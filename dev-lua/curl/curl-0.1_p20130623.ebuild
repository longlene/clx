# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="869097081ca2cbee19c557590d163504f4835884"

DESCRIPTION="CURL Wrapper"
HOMEPAGE="https://github.com/clementfarabet/curl"
SRC_URI="https://github.com/clementfarabet/curl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
	dev-lua/lua-cjson
	sci-libs/torch-sys
"

src_install() {
	insinto $(lua_get_sharedir)/curl
	doins init.lua
	dodoc README.md
}
