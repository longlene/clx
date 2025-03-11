# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop vcs-snapshot

EGIT_COMMIT="6f30fc8502ade6fd510d6ef8280686ada7b60964"

DESCRIPTION="Connect to Plan 9 CPU servers from other operating systems"
HOMEPAGE="https://github.com/9fans/drawterm"
SRC_URI="https://github.com/9fans/drawterm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_compile() {
	CONF=unix emake
}

src_install() {
	dobin drawterm
	insinto /usr/share/pixmaps
	newins 9ball.png drawterm.png
	make_desktop_entry drawterm
	dodoc README.md
}
