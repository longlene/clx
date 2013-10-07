# Distributed under the terms of the GNU General Public License v2

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin vcs-snapshot

DESCRIPTION="vim plugin: Use snippet files under neocomplcache."
HOMEPAGE="https://github.com/Shougo/neosnippet"
SRC_URI="https://github.com/Shougo/${PN}/tarball/ver.${PV} -> ${P}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${DEPEND}
app-vim/vital
!app-vim/snipmate"
#app-vim/neocomplcache"

VIM_PLUGIN_HELPFILES="neocomplcache-snippets-complete"

src_prepare() {
	rm autoload/vital.vim # for file collision, already in vital
}
