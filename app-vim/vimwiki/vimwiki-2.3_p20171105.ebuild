# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vcs-snapshot vim-plugin

EGIT_COMMIT="7c2ae8a714a71956297cb291dbaefb6a0ce47da3"

DESCRIPTION="vim plugin: Personal Wiki for Vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2332"
SRC_URI="https://github.com/vimwiki/vimwiki/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

