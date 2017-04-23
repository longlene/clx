# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="57d9634c3807f15ac6b94f98a206bdc9933f55e2"

DESCRIPTION="TMUX-C(luster)-SSH"
HOMEPAGE="https://github.com/dennishafemann/tmux-cssh"
SRC_URI="https://github.com/dennishafemann/tmux-cssh/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-misc/tmux
"

src_install() {
	dobin tmux-cssh
	dodoc README.md
}
