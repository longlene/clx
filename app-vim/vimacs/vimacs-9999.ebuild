# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion eutils vim-plugin

DESCRIPTION="Vim-Improved eMACS: an Emacs emulation for Vim"
HOMEPAGE="http://www.algorithm.com.au/code/vimacs/index.html
	http://sigil.com.au/svn/trunk/Vimacs/"
ESVN_REPO_URI="http://sigil.com.au/svn/trunk/Vimacs"
SRC_URI=""
LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="vimacs tab-indent"

# ESVN_OFFLINE="yes"
ESVN_UP_FREQ="12"


src_install () {
	dosym vim /usr/bin/vimacs || die
	dosym vim /usr/bin/vemacs || die
	dosym gvim /usr/bin/gvimacs || die
	dosym gvim /usr/bin/gvemacs || die

	vim-plugin_src_install
}
