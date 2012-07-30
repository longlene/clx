# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-proxy/polipo/polipo-1.0.4.ebuild,v 1.3 2009/09/13 14:41:29 maekke Exp $

inherit eutils git

DESCRIPTION="A caching web proxy"
HOMEPAGE="http://www.pps.jussieu.fr/~jch/software/polipo/"
#SRC_URI="http://www.pps.jussieu.fr/~jch/software/files/${PN}/${P}.tar.gz"
EGIT_REPO_URI="git://git.torproject.org/git/polipo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-apps/texinfo"

pkg_setup() {
	enewgroup polipo
	enewuser polipo -1 -1 /var/cache/polipo polipo
}

src_compile() {
	emake PREFIX=/usr "CDEBUGFLAGS=${CFLAGS}" all || die "build failed"
}

src_install() {
	einstall PREFIX=/usr MANDIR=/usr/share/man INFODIR=/usr/share/info "TARGET=${D}" || die "install failed"

	newinitd "${FILESDIR}/polipo.initd" polipo
	insinto /etc/polipo ; doins "${FILESDIR}/config"
	exeinto /etc/cron.daily ; newexe "${FILESDIR}/polipo.crond" polipo.sh

	diropts -m0750 -o polipo -g polipo
	keepdir /var/cache/polipo

	dodoc CHANGES README
	dohtml html/*
}

pkg_postinst() {
	einfo "Do not forget to read the manual."
	einfo "Change the config file in /etc/polipo to suit your needs."
}
