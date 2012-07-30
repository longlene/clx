# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Use your Twitter account as your Pidgin status message."
HOMEPAGE="http://code.google.com/p/pidgin-twitterstatus/"
SRC_URI="http://pidgin-twitterstatus.googlecode.com/files/twitter-${PV}.pl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=">=net-im/pidgin-2.0.0[perl]
	>=dev-perl/XML-XPath-1.10"
RDEPEND="${DEPEND}"

src_unpack() {
	return
}

src_install() {
	insinto /usr/lib/pidgin
	doins "${DISTDIR}/twitter-${PV}.pl"
}
