# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="818868e23521ec1eb6b4bea32714fe39024e01db"

DESCRIPTION="TREPL is a command-line REPL for Torch."
HOMEPAGE="https://github.com/torch/trepl"
SRC_URI="https://github.com/torch/trepl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	sys-libs/readline
	sci-libs/torch7
"
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) -shared -fPIC ${CFLAGS} -I/usr/include/luajit-2.0 -o readline.so readline.c -lluajit-5.1 -lreadline
	$(tc-getCC) -shared -fPIC ${CFLAGS} -I/usr/include/luajit-2.0 -o treplutils.so utils.c -lluajit-5.1
}

src_install() {
	for name in readline treplutils ; do
		lua_install_cmodule "${name}.so"
	done

	insinto $(lua_get_sharedir)/trepl
	for name in init colors colorize ; do
		doins "${name}.lua"
	done

	exeinto /usr/bin
	doexe th

	dodoc README.md
}
