# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

EGIT_COMMIT="56e8e41ef863a0a7d33d85c3c0c895aa6e9e62d3"

DESCRIPTION="vim plugin: pandoc markdown syntax"
HOMEPAGE="https://github.com/vim-pandoc/vim-pandoc-syntax"
SRC_URI="https://github.com/vim-pandoc/vim-pandoc-syntax/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

