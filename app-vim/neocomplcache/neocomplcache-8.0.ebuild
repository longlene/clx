# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vim-plugin vcs-snapshot

DESCRIPTION="vim plugin: ultimate auto completion system"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2620"
LICENSE="MIT"
KEYWORDS="amd64 x86"
IUSE=""

SRC_URI="https://github.com/Shougo/neocomplcache/archive/ver.${PV}.tar.gz -> ${P}.tar.gz"

RDEPEND="app-vim/vital"

VIM_PLUGIN_HELPFILES="${PN}.txt"

src_prepare() {
	rm autoload/vital.vim # for file collision
}
