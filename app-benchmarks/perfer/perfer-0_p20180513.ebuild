# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="1f580f88640a95bf81a65a36e6420eeec0d03c31"

DESCRIPTION="HTTP performance benchmark tool"
HOMEPAGE="https://github.com/ohler55/perfer"
SRC_URI="https://github.com/ohler55/perfer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i 's#gcc-6#gcc#' src/Makefile
}

src_install() {
	dobin bin/${PN}
	dodoc README.md
}
