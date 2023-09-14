# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="d023a45bb1671c1b5ff7f483aced676974be838a"

DESCRIPTION="MIT CADR simulator"
HOMEPAGE="https://github.com/unya/usim"
SRC_URI="https://github.com/unya/usim/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake usim
}

src_install() {
	dobin usim
	dodoc README
}

