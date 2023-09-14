# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vcs-snapshot vim-plugin

EGIT_COMMIT="e9a24376c17817632951088838a3c3bdc1c5da30"

DESCRIPTION="vim plugin: pandoc integration and utilities for vim"
HOMEPAGE="https://github.com/vim-pandoc/vim-pandoc"
SRC_URI="https://github.com/vim-pandoc/vim-pandoc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

