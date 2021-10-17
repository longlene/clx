# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="a simple http server for mostly static content"
HOMEPAGE="http://linux.bytesex.org/misc/webfs.html"
SRC_URI="https://www.kraxel.org/releases/webfs/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/prefix/{s#/usr/local#/usr#}' \
		-e '/INSTALL_BINARY/{s#-s##}' \
		-i mk/Variables.mk
}

