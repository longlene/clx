# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="3e0eac9b7a611bb8142db82789f307f2f0ad1c33"

DESCRIPTION="A fast multi-producer, multi-consumer lock-free concurrent queue for C++11"
HOMEPAGE="https://github.com/cameron314/concurrentqueue"
SRC_URI="https://github.com/cameron314/concurrentqueue/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins {,blocking}${PN}.h
	dodoc README.md
}
