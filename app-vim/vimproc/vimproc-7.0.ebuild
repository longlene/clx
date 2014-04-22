# Distributed under the terms of the GNU General Public License v2

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin vcs-snapshot

DESCRIPTION="vim plugin: Powerful shell implemented by vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id="
SRC_URI="https://github.com/Shougo/vimproc.vim/archive/ver.${PV}.tar.gz -> ${P}.tar.gz"
LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_compile() {
	emake -f make_unix.mak || die "compile failed"
}
