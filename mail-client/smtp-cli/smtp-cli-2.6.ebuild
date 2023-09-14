# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="smtp-cli is a powerful SMTP command line client with a support for
advanced features, such as STARTTLS, SMTP-AUTH, or IPv6 and with a scriptable
message"

HOMEPAGE="http://www.logix.cz/michal/devel/smtp-cli/"

SRC_URI="http://omploader.org/vMm52ag/${P}"

LICENSE="GPL-1"

SLOT="0"

KEYWORDS="~x86"

IUSE="ipv6"

RDEPEND=">=dev-lang/perl-5.8.8-r6 >=virtual/perl-IO-1.23.01 
ipv6? ( >=dev-perl/IO-Socket-INET6-2.51 ) 
>=dev-perl/MIME-Lite-3.01 
>=dev-perl/File-Type-0.22"

src_unpack() {
    cp ${DISTDIR}/${P} ${WORKDIR}/${PN}
}

src_install() {
	dobin "${WORKDIR}/${PN}" || die "Failed to install smtp-cli"
}
