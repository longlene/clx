# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A date and time library based on the C++11"
HOMEPAGE="https://github.com/HowardHinnant/date"
SRC_URI="https://github.com/HowardHinnant/date/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DENABLE_DATE_TESTING=OFF
	)
	cmake-utils_src_configure
}
