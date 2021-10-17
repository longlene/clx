# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="093c0c3e5c4d46929d8b4e50da3c2e57a16b8bbf"

DESCRIPTION="A speech synthesis library for Lua"
HOMEPAGE="https://github.com/ittner/lua-espeak"
SRC_URI="https://github.com/ittner/lua-espeak/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-accessibility/espeak
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/LUAPKG\ =/{s#lua5.1#lua#}' Makefile
}

src_compile() {
	emake all
}

src_install() {
	lua_install_cmodule espeak.so
	dodoc README
}
