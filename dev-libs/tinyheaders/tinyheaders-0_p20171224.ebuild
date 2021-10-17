# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="36b76032af73f2140f3899ed26880b59c9ecf8d7"

DESCRIPTION="Collection of one-file C/C++ libraries with no dependencies, primarily used for games"
HOMEPAGE="https://github.com/RandyGaul/tinyheaders"
SRC_URI="https://github.com/RandyGaul/tinyheaders/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins *.h
	dodoc README.md
}
