# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit multilib

DESCRIPTION="Pure C implementation of Go channels"
HOMEPAGE="https://github.com/tylertreat/chan"
SRC_URI="https://github.com/tylertreat/chan/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s|\$(PREFIX)/lib|\$(PREFIX)/$(get_libdir)|" Makefile
}

src_compile() {
	emake PREFIX="${D}"/usr
}

src_install() {
	emake PREFIX="${D}"/usr install
}
