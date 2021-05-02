# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin vcs-snapshot

DESCRIPTION="vim plugin:Ultimate Vim package manager"
HOMEPAGE="https://github.com/Shougo/neobundle.vim"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

SRC_URI="https://github.com/Shougo/neobundle.vim/archive/ver.${PV}.tar.gz -> ${P}.tar.gz"

VIM_PLUGIN_HELPFILES="${PN}.txt"

