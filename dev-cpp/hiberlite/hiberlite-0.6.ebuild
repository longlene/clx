# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="C++ object-relational mapping API inspired by Boost.Serialization"
HOMEPAGE="http://code.google.com/p/hiberlite"
SRC_URI="http://${PN}.googlecode.com/files/${P}.zip"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
DEPEND=">=dev-db/sqlite-3.6"

src_install() {
	emake INSTALL_PREFIX="${D}/usr" install || die "install failed"
}
