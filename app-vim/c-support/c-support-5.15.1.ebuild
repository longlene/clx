# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/c-support/c-support-5.13.ebuild,v 1.1 2011/04/29 04:28:46 radhermit Exp $

EAPI="4"
VIM_PLUGIN_VIM_VERSION="7.0"

inherit vim-plugin

DESCRIPTION="vim plugin: C/C++-IDE -- Write and run programs using menus and hotkeys"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=213"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=14859 -> ${P}.zip"
LICENSE="public-domain"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="csupport.txt"

DEPEND="app-arch/unzip"

S=${WORKDIR}

src_install() {
	dodoc ${PN}/doc/{ChangeLog,c-hotkeys.pdf}
	rm -rf ${PN}/doc README.csupport

	vim-plugin_src_install
}
