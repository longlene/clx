# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A cross-platform build utility based on Lua"
HOMEPAGE="https://xmake.io"
SRC_URI="https://github.com/tboox/xmake/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

local target
if use amd64 ; then
	target=x86_64
elif use x86 ; then
	target=i386
fi

QA_PRESTRIPPED="/usr/share/xmake/xmake"

src_prepare() {
	default
	sed -i '/RANLIB/d' core/suffix.mak
}

src_compile() {
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
	
