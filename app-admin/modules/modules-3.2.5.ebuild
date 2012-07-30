# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="Provides for the dynamic modification of a user's environment"
HOMEPAGE="http://modules.sourceforge.net/"
SRC_URI="mirror://sourceforge/modules/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND=">=dev-lang/tcl-8"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${P}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	cd "${D}/usr/Modules/${PV}/modulefiles"
	rm *
	touch "${D}/usr/Modules/${PV}/modulefiles/.keep"

	cd "${D}/usr/Modules"
	ln -s "${PV}" default

	cd "${WORKDIR}"
	dodoc LICENSE.GPL README TODO NEWS INSTALL ChangeLog
}

pkg_postinst() {
	echo
	einfo "Add this line at the end of /etc/bash/bashrc:"
	einfo "    [ -e \"/usr/Modules/${PV}/init/bash\" ] && source \"/usr/Modules/${PV}/init/bash\""
	echo
}
