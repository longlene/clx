# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A Minimal, Header only Modern c++ library for colors in your terminal"
HOMEPAGE="https://github.com/agauniyal/rang"
SRC_URI="https://github.com/agauniyal/rang/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins include/rang.hpp
	dodoc README.md
}
