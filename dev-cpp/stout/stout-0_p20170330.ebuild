# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="6f3ddb489ef2a26c1e4639ea402a60b16d4474b2"

DESCRIPTION="A C++ library for building sturdy software"
HOMEPAGE="https://github.com/longlene/stout"
SRC_URI="https://github.com/longlene/stout/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-cpp/picojson
"

src_install() {
	insinto /usr/include
	doins -r include/stout
	dodoc README.md
}
