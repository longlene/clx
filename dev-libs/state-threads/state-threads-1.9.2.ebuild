# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="State Threads Library"
HOMEPAGE="https://github.com/ossrs/state-threads http://sourceforge.net/projects/state-threads"
SRC_URI="https://github.com/ossrs/state-threads/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( README.md )

src_prepare() {
	default
	sed -i 's/@prefix@/\/usr/' st.pc.in
	sed -i "/libdir/ s/\/lib/\/$(get_libdir)/" st.pc.in
}

src_compile() {
	emake linux-debug
}

src_install() {
	einstalldocs
	local targetdir="LINUX_$(uname -r)_DBG"
	dolib.a ${targetdir}/libst.a

	insinto /usr/include
	doins ${targetdir}/st.h
}
