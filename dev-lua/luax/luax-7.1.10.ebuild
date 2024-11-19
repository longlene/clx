# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ninja-utils

DESCRIPTION="luax is a Lua interpreter and REPL based on Lua 5.4"
HOMEPAGE="
	https://cdelord.fr/luax
	https://github.com/CDSoft/luax
"
SRC_URI="https://github.com/CDSoft/luax/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	% use gcc instead of zig
	sed -e '/tools\/bang.lua -o/{s#\$in#\$in -- gcc#}' \
		-i bootstrap.ninja
	sed -e '/.git\/refs\/tags/d' \
		-i build.lua
	sed -e "/= sh/{s#git describe --tags#echo ${PV}#}" \
		-e "/= sh/{s#git show -s --format=%cd --date=format:'%Y-%m-%d'#date +%Y-%m-%d#}" \
		-e "/= sh/{s#git show -s --format=%cd --date=format:'%Y'#date +%Y#}" \
		-i tools/luax_config.h.in
	sed -e "/= sh/{s#git describe --tags#echo ${PV}#}" \
		-e "/= sh/{s#git show -s --format=%cd --date=format:'%Y-%m-%d'#date +%Y-%m-%d#}" \
		-e "/= sh/{s#git show -s --format=%cd --date=format:'%Y'#date +%Y#}" \
		-i tools/luax_config.lua.in
}

src_configure() {
	eninja -f bootstrap.ninja
}

src_compile() {
	eninja
}

src_install() {
	dobin .build/bin/luax
	einstalldocs
}
