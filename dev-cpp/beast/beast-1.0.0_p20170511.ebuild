# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="f2d825594ee34ccc1ebc0b231899a1735245778d"

DESCRIPTION="HTTP and WebSocket built on Boost.Asio in C++11"
HOMEPAGE="https://github.com/vinniefalco/Beast"
SRC_URI="https://github.com/vinniefalco/Beast/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[context,threads]
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/beast
	dodoc README.md
}
