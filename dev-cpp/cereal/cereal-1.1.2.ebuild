# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

#inherit cmake-utils

DESCRIPTION="A C++11 library for serialization"
HOMEPAGE="https://github.com/USCiLab/cereal"
SRC_URI="mirror://github/USCiLab/cereal/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/boost
"

src_install() {
	insinto /usr/include
	doins -r include/cereal
	dodoc README.md
}
