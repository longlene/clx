# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="24887ac1fcafbdbbec0f2500fec9ff245fc4f84d"

DESCRIPTION="Redux for C++"
HOMEPAGE="https://github.com/arximboldi/lager"
SRC_URI="https://github.com/arximboldi/lager/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/zug
	dev-libs/boost
"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r lager
	dodoc README.rst
}
