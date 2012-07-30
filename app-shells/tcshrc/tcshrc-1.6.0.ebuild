# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Package of tcsh login scripts supplying advanced command-line
completion and aliases."
HOMEPAGE="http://tcshrc.sourceforge.net"
SRC_URI="mirror://sourceforge/tcshrc/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="app-shells/tcsh"

src_compile() {
	epatch "${FILESDIR}"/make_destdir_patch.diff
}

src_install() {
	emake DESTDIR="${D}" systeminstall || die "Install failed"
}

pkg_postinst() {
	einfo "To have new accounts use these login scripts,"
	einfo "execute the following as root:"
	einfo "   tcshrc_config -s"
	einfo ""
	einfo "For existing accounts there are two options,"
	einfo "  1.) Users opt-in by running:"
	einfo "         tcshrc_config -u"
	einfo "  2.) As root point the default login to the"
	einfo "      tcshrc login scripts.  Probably should"
	einfo "      copy them from /etc/skel."
}
