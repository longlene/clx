# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

DESCRIPTION="C Websockets Server Library"
HOMEPAGE="http://git.warmcat.com/cgi-bin/cgit/libwebsockets/"
SRC_URI="http://git.warmcat.com/cgi-bin/cgit/libwebsockets/snapshot/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh && econf
}
