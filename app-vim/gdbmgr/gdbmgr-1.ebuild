# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.3"
inherit vim-plugin toolchain-funcs

DESCRIPTION="vim plugin: vim interface to gdb"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=4104"
SRC_URI="${P}.tar.gz"

LICENSE="vim"
KEYWORDS="~amd64"
IUSE=""

VIM_PLUGIN_HELPFILES="gdbmgr"

DEPEND="|| ( app-editors/vim[perl] 
		app-editors/vim[python] 
		app-editors/vim[ruby] )"
RDEPEND="${DEPEND}
	sys-devel/gdb"

S="${WORKDIR}"

src_configure() {
	sed -i \
		-e "s|gcc|$(tc-getCC)|" \
		-e "s|\(-shared\)|${LDFLAGS} \1|" \
		gdbmgr/src/Makefile || die "sed failed"
}

src_compile() {
	emake -C gdbmgr/src
}

src_install() {
	dolib.so gdbmgr/src/gdbmgr.so
	rm -rf gdbmgr || die "removing sources failed"
	vim-plugin_src_install
}
