# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib

DESCRIPTION="State Threads Library"
HOMEPAGE="https://github.com/winlinvip/state-threads http://sourceforge.net/projects/state-threads"
SRC_URI="https://github.com/winlinvip/state-threads/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs debug example"

DEPEND=""
RDEPEND="${DEPEND}"

QA_EXECSTACK=usr/lib/lib${PN}.so*

S="${WORKDIR}/state-threads-${PV}"

multilib_toolchain_setup

src_prepare() {
	sed -i 's/@prefix@/\/usr/' st.pc.in
	sed -i "/libdir/ s/\/lib/\/${get_libdir}/" st.pc.in
}

src_compile() {

	local mybuildtype=""
	if use debug; then
		mybuildtype="DBG"
	else
		mybuildtype="OPT"
	fi
	emake -j1 OS=LINUX BUILD=${mybuildtype}
}

# TODO: QA warning
src_install() {
	local mytargetdir=""
	if use debug ; then
		mytargetdir=LINUX_$(uname -r)_DBG
	else
		mytargetdir=LINUX_$(uname -r)_OPT
	fi
	dolib.so ${mytargetdir}/libst.so*
	use static-libs && dolib.a ${mytargetdir}/libst.a

	insinto /usr/include
	doins ${mytargetdir}/st.h

	insinto ${PKG_CONFIG_LIBDIR}/st.pc
	doins st.pc
}
