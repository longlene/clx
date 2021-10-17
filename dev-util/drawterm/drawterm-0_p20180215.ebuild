# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils vcs-snapshot

EGIT_COMMIT="7786ec11fd3e94e894d845975d3aded0391ff0f5"

DESCRIPTION="Connect to Plan 9 CPU servers from other operating systems"
HOMEPAGE="https://github.com/0intro/drawterm"
SRC_URI="https://github.com/0intro/drawterm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	make_desktop_entry drawterm "Connect to Plan 9 CPU servers" drawterm
	dodoc README.md
}
