# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A header-only, very fast and memory-friendly hash map"
HOMEPAGE="https://github.com/greg7mdp/parallel-hashmap"
SRC_URI="https://github.com/greg7mdp/parallel-hashmap/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r parallel_hashmap
	dodoc README.md
}
