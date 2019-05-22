# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="35086597a72d94d8393e6a90b96e553d714085bd"

DESCRIPTION="A minimalistic JSON parser in C"
HOMEPAGE="http://zserge.com/jsmn.html"
SRC_URI="https://github.com/zserge/jsmn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins jsmn.h
	dolib.a libjsmn.a
	dodoc README.md
}
