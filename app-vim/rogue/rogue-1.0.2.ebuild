# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Porting of Rogue-clone II for Vim"
HOMEPAGE="https://github.com/katono/rogue.vim"
SRC_URI="https://github.com/katono/rogue.vim/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
S="${WORKDIR}"/${PN}.vim-${PV}
KEYWORDS="~amd64 ~arm ~x86"
