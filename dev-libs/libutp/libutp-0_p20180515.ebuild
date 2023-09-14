# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="2b364cbb0650bdab64a5de2abb4518f9f228ec44"

DESCRIPTION="uTorrent Transport Protocol library"
HOMEPAGE="https://github.com/bittorrent/libutp"
SRC_URI="https://github.com/bittorrent/libutp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins utp.h utp_types.h
	dolib.so libutp.so
	dodoc README.md
}
