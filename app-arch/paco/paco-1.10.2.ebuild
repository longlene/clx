# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools bash-completion

DESCRIPTION="Paco is a source code package organizer"
HOMEPAGE="http://paco.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk nls"

DEPEND="gtk? ( >=gtk+-2.6.0 )
	nls? ( sys-devel/gettext )"

src_unpack() {
	unpack ${A}
	einfo "Fixing Makefile.am"
	cd "${S}"
	sed --in-place -e 's/$(sysconfdir)/$(DESTDIR)$(sysconfdir)/g' doc/Makefile.am \
	|| die "sed failed"
	WANT_AUTOMAKE="1.8" eautoreconf
}

src_compile() {
	econf \
	$(use_enable gtk gpaco) \
	$(use_enable nls) \
	--enable-pacoball || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS BUGS ChangeLog README
	dobashcompletion scripts/paco_bash_completion
}

pkg_postinst() {
	bash-completion_pkg_postinst
}
