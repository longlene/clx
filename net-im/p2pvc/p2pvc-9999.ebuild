# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="A point to point color terminal video chat"
HOMEPAGE="https://github.com/mofarrell/p2pvc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mofarrell/p2pvc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	media-libs/opencv
	media-libs/portaudio
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"

src_install() {
	dobin p2pvc
	dodoc README.md
}
