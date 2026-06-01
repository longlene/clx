# Distributed under the terms of the GNU General Public License v2

EAPI=8

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin vcs-snapshot

DESCRIPTION="vim plugin: Powerful shell implemented by vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id="
SRC_URI="https://github.com/Shougo/vimshell.vim/archive/ver.${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-vim/vimproc"

src_configure() {
	rm autoload/vital.vim
}
