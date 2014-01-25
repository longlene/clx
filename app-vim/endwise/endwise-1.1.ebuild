# Distributed under the terms of the GNU General Public License v2

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION='vim plugin: wisely add "end"'
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2386"
SRC_URI="https://github.com/tpope/vim-endwise/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

S=${WORKDIR}/vim-${P}
