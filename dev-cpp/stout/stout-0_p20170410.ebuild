# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="f08657642fa3923923344008e35976386937b62f"

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
