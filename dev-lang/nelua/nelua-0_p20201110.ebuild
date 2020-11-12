# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="be3b9d02762e1e168c01c8ab321ddbc69f1e11f7"

DESCRIPTION="Nelua Programming Language"
HOMEPAGE="https://nelua.io/"
SRC_URI="https://github.com/edubart/nelua-lang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e 's:\(define LUA_ROOT\s*\).*:\1"'${EPREFIX}'/usr/":' \
		-e "s:\(define LUA_CDIR\s*LUA_ROOT \"\)lib:\1$(get_libdir):" \
		-i src/lua/luaconf.h \
		|| die "failed patching luaconf.h"
	sed -e '/PREFIX=/{s:/usr/local:/usr:}' \
		-e '/LDFLAGS=-s/d' \
		-i src/Makefile
}

src_install() {
	dobin src/nelua-lua
	newbin nelua.sh nelua
	insinto /usr/lib/nelua/lualib
	doins -r nelua.lua nelua
	insinto /usr/lib/nelua
	doins -r lib
	dodoc README.md
}

