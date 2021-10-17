# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="ded4b7f5b4e0b942e875f4b74b46df038c3c10f6"

DESCRIPTION="header only log inherited from Nanolog"
HOMEPAGE="https://github.com/qicosmos/nanolog"
SRC_URI="https://github.com/qicosmos/nanolog/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins nanolog.hpp
	dodoc README.md
}
