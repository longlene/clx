# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="A cross-platform build utility based on Lua"
HOMEPAGE="https://xmake.io"
SRC_URI="
	https://github.com/tboox/xmake/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/tboox/tbox/archive/v1.6.6.tar.gz -> tbox-1.6.6.tar.gz
	https://github.com/LuaJIT/LuaJIT/archive/1d8b747c161db457e032a023ebbff511f5de5ec2.tar.gz -> luajit-2.1_p20201012.tar.gz
	https://github.com/xmake-io/xmake-core-sv/archive/9a3cf7c8e589de4f70378824329882c4a047fffc.tar.gz -> xmake-core-sv-1.0_p20190825.tar.gz
	https://github.com/wmcbrine/PDCurses/archive/3.9.tar.gz -> pdcurses-3.9.tar.gz
	https://github.com/xmake-io/xmake-core-lua-cjson/archive/515bab6d6d80b164b94db73af69609ea02f3a798.tar.gz -> xmake-core-lua-cjson-2.1.0_p20200909.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


QA_PRESTRIPPED="/usr/share/xmake/xmake"

src_prepare() {
	default
	sed -i '/RANLIB/d' core/suffix.mak
	rmdir core/src/tbox/tbox
	mv ${WORKDIR}/tbox-1.6.6 core/src/tbox/tbox
	rmdir core/src/luajit/luajit
	mv ${WORKDIR}/luajit-2.1_p20201012 core/src/luajit/luajit
	rmdir core/src/sv/sv
	mv ${WORKDIR}/xmake-core-sv-1.0_p20190825 core/src/sv/sv
	rmdir core/src/pdcurses/pdcurses
	mv ${WORKDIR}/pdcurses-3.9 core/src/pdcurses/pdcurses
	rmdir core/src/lua-cjson/lua-cjson
	mv ${WORKDIR}/xmake-core-lua-cjson-2.1.0_p20200909 core/src/lua-cjson/lua-cjson
}

src_compile() {
	local target
	if use amd64 ; then
		target=x86_64
	elif use x86 ; then
		target=i386
	fi
	ARCH=${target} emake -j1 build
}

src_install() {
	insinto /usr/share
	doins -r xmake
	exeinto /usr/share/xmake
	newexe core/src/demo/demo.b xmake
	cat >> xmake.sh <<EOF
#!/bin/sh
XMAKE_PROGRAM_DIR=/usr/share/xmake /usr/share/xmake/xmake \$@
EOF
	newbin xmake.sh xmake
	dodoc README.md
}

