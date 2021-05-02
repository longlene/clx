# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

DESCRIPTION="vim plugin: unite all sources"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=3396"
SRC_URI="https://github.com/Shougo/unite.vim/archive/ver.${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="${PN}.txt"
