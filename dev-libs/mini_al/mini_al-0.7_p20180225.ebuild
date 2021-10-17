# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="891258a5b0c463ada17c544c438fb6fe6d4f148c"

DESCRIPTION="Single file audio playback and capture library"
HOMEPAGE="https://github.com/dr-soft/mini_al"
SRC_URI="https://github.com/dr-soft/mini_al/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins mini_al.h
	dodoc README.md
}
