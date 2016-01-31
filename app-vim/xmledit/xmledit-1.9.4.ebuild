# Distributed under the terms of the GNU General Public License v2

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: A file type plugin to help edit XML documents. It includes tag completion and tag jumping"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=301"
SRC_URI="https://github.com/Valloric/xmledit/archive/1.9.4.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="xmledit"
#VIM_PLUGIN_HELPTEXT=""
#VIM_PLUGIN_HELPURI=""
#VIM_PLUGIN_MESSAGES=""

src_prepare() {
	rm build.vim
	rm Makefile
}
