# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="SAX-style TOML parser for C++11"
HOMEPAGE="https://github.com/andrusha97/loltoml"
SRC_URI="https://github.com/andrusha97/loltoml/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	$(cmake_use_enable test TESTING)
	)
	cmake_src_configure
}
