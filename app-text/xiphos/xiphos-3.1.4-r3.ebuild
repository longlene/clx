# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/xiphos/xiphos-3.1.4-r3.ebuild,v 1.0 2010/05/16 00:29:08  Exp $

EAPI=5
GCONF_DEBUG=no

inherit gnome2 flag-o-matic

DESCRIPTION="GTK+ based Bible study software, formerly gnomesword"
HOMEPAGE="http://xiphos.org/"
SRC_URI="mirror://sourceforge/gnomesword/${P}.tar.gz"

LICENSE="GPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"


RDEPEND="dev-libs/glib:2
	>=x11-libs/gtk+-2.14:2
	dev-libs/libxml2:2
	>=gnome-base/libglade-2:2.0
	>=gnome-extra/gtkhtml-3.23:3.14
	>=app-text/sword-1.6.1
	dev-libs/dbus-glib
	gnome-extra/libgsf
	"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext
	app-text/rarian
	>=app-text/gnome-doc-utils-0.3.2
	dev-libs/nspr"
#PDEPEND="dev-libs/libxml2[-icu]"

pkg_setup() {
	
	G2CONF="--docdir=/usr/share/doc/${PF}
		--disable-dependency-tracking"

	
	G2CONF="${G2CONF} --without-gecko"
	

	append-cppflags -I/usr/include/nspr
}

src_unpack() {
	unpack "${A}"
	cd "${S}"
#	epatch "${FILESDIR}/${P}-extern-C.patch"
	epatch "${FILESDIR}/xiphos-3.1.4-extern-C.patch"
}

src_configure() {
    cd ${S}
    ./waf configure --prefix=/usr --enable-gtkhtml 
}

src_compile() {
    cd ${S} 
    ./waf build || die "failed build"
}

src_install() {
    cd ${S}
    ./waf install --destdir=${D} 
#	gnome2_src_install
	prepalldocs
}

pkg_postinst() {
	gnome2_pkg_postinst
	elog "Xiphos requires modules to be of any use. You may install the"
	elog "sword modules packages in app-dicts/, or download modules"
	elog "individually from the sword website: http://crosswire.org/sword/"
}
