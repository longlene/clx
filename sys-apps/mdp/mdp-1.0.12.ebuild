# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A command-line based markdown presentation tool"
HOMEPAGE="https://github.com/visit1985/mdp"
SRC_URI="https://github.com/visit1985/mdp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/ncurses"

#src_prepare() {
#	# remove the CFLAGS and LDFLAGS defination in Makefile, use default option in make.conf as the binary will be stripped automatically
#	sed -i -e '/CFLAGS[[:space:]]*=/d' -e '/LDFLAGS[[:space:]]*=/d' Makefile
#}


src_install() {
	dobin mdp
}
