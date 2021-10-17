# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

DESCRIPTION="simple and easy socket support for lua"
HOMEPAGE="http://tset.de/lsocket/index.html"
SRC_URI="http://tset.de/downloads/${P}-1.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.so ${PN}.so
	dodoc -r doc/*
}
