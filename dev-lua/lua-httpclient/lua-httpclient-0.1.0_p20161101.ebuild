# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="de03a3881b56043d1ac52325ff117b30a6437eb2"

DESCRIPTION="A unified http/s client library for lua"
HOMEPAGE="https://github.com/lusis/lua-httpclient"
SRC_URI="https://github.com/lusis/lua-httpclient/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
	dev-lua/inspect
"

src_compile() {
	:
}

src_install() {
	insinto $(lua_get_sharedir)/httpclient
	doins -r src/httpclient{,.lua}
	dodoc README.md
}
