# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="15184018a0aaf8fc72d50800b46bd0c4d194ea38"

DESCRIPTION="Stack trace visualizer"
HOMEPAGE="https://github.com/brendangregg/FlameGraph/"
SRC_URI="https://github.com/brendangregg/FlameGraph/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	newbin flamegraph.pl flamegraph
	dodoc README.md
}
