# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="5d2e7172d68238a957e50609fc09da5201a8f0cc"

DESCRIPTION="Pattern-defeating quicksort"
HOMEPAGE="https://github.com/orlp/pdqsort"
SRC_URI="https://github.com/orlp/pdqsort/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins pdqsort.h
	dodoc readme.md
}
