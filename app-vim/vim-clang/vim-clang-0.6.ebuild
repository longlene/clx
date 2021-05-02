# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Clang completion plugin for vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id="
SRC_URI="https://github.com/justmao945/vim-clang/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

