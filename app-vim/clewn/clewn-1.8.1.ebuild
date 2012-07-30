# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils vim-doc

DESCRIPTION="A small utility which allows debugging from within vim"
HOMEPAGE="http://clewn.sourceforge.net"
SRC_URI="mirror://sourceforge/clewn/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=app-editors/gvim-7.0
	sys-libs/readline"
RDEPEND=${RDEPEND}
S=${WORKDIR}/${PN}

pkg_setup() {
	if ! built_with_use app-editors/gvim netbeans ; then
		eerror "Please (re)emerge gvim with netbeans USE flag on before "
		eerror "emerging clewn" 
		die "please (re)emerge app-editors/gvim with USE='netbeans'"
	fi
}

src_install() {
	dodoc README.txt CHANGELOG 
	dobin clewn
	dodir /usr/share/vim/vimfiles/
	tar -xzf ${S}/runtime/clewn_runtime.tgz -C ${D}/usr/share/vim/vimfiles
}

pkg_postinst() {
	update_vim_helptags
}
