# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="41dc0bc4766f6f5fdfc6ad3f3e9f567b60488211"

DESCRIPTION="Libbele, a simple library to marshal an integer to or from little-endian or big-endian formats"
HOMEPAGE="https://github.com/0intro/libbele"
SRC_URI="https://github.com/0intro/libbele/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a libbele.a
	insinto /usr/include
	doins bele.h
	dodoc README.md
}
