# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib

DESCRIPTION="Friendly Interactive ZSHell"
HOMEPAGE="https://github.com/zsh-users/fizsh"
SRC_URI="https://github.com/zsh-users/fizsh/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
#KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}/fizsh-dev

src_configure() {
	econf --prefix=/usr --includedir=/usr/include --bindir=/usr/bin --libexecdir=/usr/$(get_libdir)/fizsh --localstatedir=/var --sysconfdir=/etc
}
