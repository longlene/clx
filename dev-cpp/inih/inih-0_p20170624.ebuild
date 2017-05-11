# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="4cf18372437cd153db3f9cb0c41be63bfe815f42"

DESCRIPTION="inih (INI Not Invented Here)"
HOMEPAGE="https://github.com/jtilly/inih"
SRC_URI="https://github.com/jtilly/inih/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins INIReader.h
	dodoc README.md
}
