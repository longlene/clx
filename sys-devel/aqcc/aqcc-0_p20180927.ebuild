# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="8c1e96f94a01f2d0d32c88897c6d4fa7dd014d7a"

DESCRIPTION="Yet another tiny tiny self-hosted C compiler"
HOMEPAGE="https://github.com/ushitora-anqou/aqcc"
SRC_URI="https://github.com/ushitora-anqou/aqcc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	newbin aqcc_detail aqcc
	dodoc README.md
}
