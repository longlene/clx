# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python multilib eutils

DESCRIPTION="Sends SMS messagges from your phone through your PC"
HOMEPAGE="http://code.google.com/p/phonetooth"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND="dev-python/pygtk
	 dev-python/pybluez
	 app-mobilephone/obexftp
	 dev-python/python-gammu
	 dev-python/pyserial"
DEPEND="${RDEPEND}"

pkg_setup() {
	if ! built_with_use app-mobilephone/obexftp python ; then
		eerror "app-mobilephone/obexftp has to be compiled with USE=python"
		die "Needed USE-flag for obexftp not found."
	fi
}
src_unpack() {
	unpack ${A}
	cd ${S}
	mv py-compile py-compile.orig
	ln -sf /bin/true py-compile
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS ChangeLog README
}

pkg_postinst() {
	python_version
	python_mod_optimize \
	"${ROOT}/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
}

pkg_postrm() {
	python_mod_cleanup
}
