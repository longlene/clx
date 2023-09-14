# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="63cb86a33423bcd9a6af8a012202a07c498ef3ec"

DESCRIPTION="GENie - Project generator tool"
HOMEPAGE="https://github.com/bkaradzic/GENie"
SRC_URI="https://github.com/bkaradzic/GENie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i 's#$(ARCH)##' build/gmake.linux/genie.make
}

src_install() {
	dobin bin/linux/genie
	dodoc README.md
}
