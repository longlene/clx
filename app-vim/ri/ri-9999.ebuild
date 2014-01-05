# Distributed under the terms of the GNU General Public License v2

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit git-2 vim-plugin

DESCRIPTION="vim plugin: ri plugin for Vim"
HOMEPAGE="https://github.com/danchoi/ri.vim"
SRC_URI=""

EGIT_REPO_URI="https://github.com/danchoi/ri.vim.git"
#EGIT_BRANCH=develop
LICENSE="as-is"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""

VIM_PLUGIN_HELPFILES=""

src_prepare() {
	rm -r .git*
}

