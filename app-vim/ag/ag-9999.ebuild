# Distributed under the terms of the GNU General Public License v2

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit git-2 vim-plugin

DESCRIPTION="vim plugin: the silver searcher"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=3881"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rking/ag.vim.git" 
#EGIT_BRANCH=develop
LICENSE="as-is"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-apps/the_silver_searcher"

VIM_PLUGIN_HELPFILES="ag"

src_prepare() {
	rm -r .git*
}

