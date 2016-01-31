# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/vimoutliner/vimoutliner-0.3.4-r2.ebuild,v 1.5 2011/01/07 22:45:02 ranger Exp $

inherit vim-plugin

DESCRIPTION="vim plugin: easy and fast outlining"
HOMEPAGE="http://www.vimoutliner.org/"
#SRC_URI="mirror://gentoo/${P}.tgz"
SRC_URI="https://github.com/downloads/vimoutliner/vimoutliner/${P}.tgz"
LICENSE="GPL-2"
KEYWORDS="alpha amd64 ia64 ~mips ppc sparc x86"
IUSE=""

VIM_PLUGIN_HELPFILES="vimoutliner"
VIM_PLUGIN_MESSAGES="filetype"

src_unpack() {
	mkdir ${P}
	cd ${P}
	unpack ${A}
	cd "${S}"
	sed -i -e '/^if exists/,/endif/d' ftdetect/vo_base.vim
	sed -i -e 's/g:vo_modules2load/g:vo_modules_load/' vimoutliner/vimoutlinerrc
	find "${S}" -type f | xargs chmod a+r
}

src_install() {
	p=/usr/share/vim/vimfiles
	insinto ${p}
	doins -r doc ftdetect ftplugin syntax colors || die "doins failed"

	# Custom vimoutlinerrc so we actually find the plugins
	cp vimoutliner/vimoutlinerrc vimoutlinerrc.global
	cat >>vimoutlinerrc.global <<-EOF

	"Gentoo-specific Configuration **************************************
	"Search path for vimoutliner plugins
	setlocal runtimepath+=\$VIM/vimfiles/vimoutliner
	EOF
	newins vimoutlinerrc.global vimoutlinerrc

	insinto ${p}/vimoutliner/plugins
	doins vimoutliner/plugin/*.vim

	dobin vimoutliner/scripts/vo_maketags.pl

	dodoc vimoutliner/vimoutlinerrc vimoutliner/plugin/*.otl doc/*
	insinto /usr/share/doc/${PF}/scripts
	doins -r $(find vimoutliner/scripts -mindepth 1 -maxdepth 1 -not -name '.*')
}
