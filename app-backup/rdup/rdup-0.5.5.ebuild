# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="rdup is a utility inspired by rsync and the plan9 way of doing backups."
HOMEPAGE="http://www.miek.nl/projects/rdup/index.html"
SRC_URI="http://www.miek.nl/projects/${PN}/${P}.tar.bz2"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="crypt ssl xattr zip"

DEPEND=">dev-libs/glib-2.0.0
	dev-util/pkgconfig"

RDEPEND="${DEPEND}
	>=app-shells/bash-3.0.0
	crypt? ( app-crypt/mcrypt )
	ssl? ( virtual/ssh )
	xattr? ( sys-apps/attr )
	zip? ( app-arch/zip )"

src_unpack() {
	unpack ${A}
	cd ${S}

	epatch ${FILESDIR}/rdup-0.3.6-bin-install.diff
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc ${S}/{README,DESIGN,ChangeLog,AUTHORS}

	insinto /usr/share/${PN}
	doins rdup.cron
}

