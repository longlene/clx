# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/guildhall/guile-irc/archive/v0.3.0.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	net-libs/gnutls[guile]
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/gnutls-cli/{s#-q#-iq#}' configure.ac
	eautoreconf
}
