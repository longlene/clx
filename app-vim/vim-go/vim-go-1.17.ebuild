# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Go development plugin for Vim"
HOMEPAGE="https://github.com/fatih/vim-go"
SRC_URI="https://github.com/fatih/vim-go/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

