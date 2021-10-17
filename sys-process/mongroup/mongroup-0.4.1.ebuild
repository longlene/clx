# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Monitor a group of processes with mon"
HOMEPAGE="https://github.com/jgallen23/mongroup"
SRC_URI="https://github.com/jgallen23/mongroup/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-process/mon
"

src_compile() {
	:
}

src_install() {
	dobin bin/mongroup
	dodoc README.md
}
