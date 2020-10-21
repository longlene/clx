# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-pkg-2 vcs-snapshot

EGIT_COMMIT="5f8596497429adaf5ff3adcaa348c0372e2f0c23"

DESCRIPTION="SquirrelJME intends to be a Java ME 8 compatible JVM"
HOMEPAGE="https://github.com/XerTheSquirrel/SquirrelJME"
SRC_URI="https://github.com/XerTheSquirrel/SquirrelJME/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jre-1.7"
RDEPEND="
	>=virtual/jre-1.7
	${DEPEND}"

src_compile() {
	mkdir build && cd build && ../build.sh
}


src_install() {
	java-pkg_dojar build/*.jar 
	dodoc README.md
}
