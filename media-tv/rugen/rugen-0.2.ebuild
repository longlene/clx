# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Rugen is a client to the MLT Miracle server"
HOMEPAGE="http://users.pandora.be/acp/rugen/"
SRC_URI="http://users.pandora.be/acp/rugen/downloads/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=media-libs/mlt-0.2 >=x11-libs/gtk+-2.0"

src_install() {
	make DESTDIR="${D}" install
}
