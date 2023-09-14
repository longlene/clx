# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib

DESCRIPTION="Apache Clownfish symbiotic object system"
HOMEPAGE="http://lucy.apache.org"
SRC_URI="mirror://apache/lucy/clownfish/apache-clownfish-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# TODO: maybe perl, ruby USE need be added?

DEPEND=""
RDEPEND="${DEPEND}"

MYMAJOR_VERSION="0.4"

multilib_toolchain_setup

src_configure() {
	cd "${S}"/runtime/c && econf
}

src_compile() {
	cd "${S}"/runtime/c && emake
}

src_install() {
	#cd "${S}"/runtime/c && ./install.sh --prefix "${D}"/usr
	dolib.so "${S}"/runtime/c/libcfish.so.${PV}
	dosym libcfish.so.${PV} /usr/$(get_libdir)/libcfish.so.${MYMAJOR_VERSION}
	dosym libcfish.so.${MYMAJOR_VERSION} /usr/$(get_libdir)/libcfish.so
	dobin "${S}"/compiler/c/cfc

	local dest=/usr/share/clownfish/include
	dodir ${dest}
	for src in `find "${S}"/runtime/core -name '*.cf[hp]' -a ! -name 'Test*'`; do
		local file=${src#"${S}"/runtime/}
		local destdir=`dirname "$dest/$file"`
		dodir $destdir
		insinto $destdir
		doins $src
	done

	doman "${S}"/runtime/c/autogen/man/man3/*

	dodir /usr/$(get_libdir)/pkgconfig
	cat > "${PKG_CONFIG_LIBDIR}"/clownfish.pc <<EOF
Name: Clownfish
Description: Symbitic object system
Version: ${PV}
URL: http://lucy.apache.org/
Libs: -L/usr/$(get_libdir) -lcfish
EOF
}
