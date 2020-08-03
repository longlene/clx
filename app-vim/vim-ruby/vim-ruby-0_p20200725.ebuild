# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vcs-snapshot vim-plugin

EGIT_COMMIT="3e4a8c5bfa3631516cc2b79672fe958455bfb098"

DESCRIPTION="vim plugin: Vim/Ruby Configuration Files"
HOMEPAGE="https://github.com/vim-ruby/vim-ruby"
SRC_URI="https://github.com/vim-ruby/vim-ruby/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

