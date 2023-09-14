# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="m9u music server"
HOMEPAGE="http://sqweek.net/code/m9u/"
SRC_URI="http://sqweek.net/9p/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-libs/libixp
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/CFLAGS/{s#-g#-DIXP_NEEDAPI=90#}' Makefile
}

src_install() {
	dobin m9u m9play m9title
	dodoc DOCUMENTATION
}
