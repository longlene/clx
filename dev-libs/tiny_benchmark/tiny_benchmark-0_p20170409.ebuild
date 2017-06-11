# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="716f5636b2367d7c720bbf2f6eb26664b8e81f27"

DESCRIPTION="YA benchmarking lib"
HOMEPAGE="https://github.com/cdacamar/tiny_benchmark"
SRC_URI="https://github.com/cdacamar/tiny_benchmark/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins include/${PN}.h
	dodoc README.md
}
