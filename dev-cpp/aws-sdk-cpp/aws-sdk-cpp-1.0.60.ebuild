# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="AWS SDK for C++"
HOMEPAGE="https://github.com/aws/aws-sdk-cpp"
SRC_URI="https://github.com/aws/aws-sdk-cpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="ssl test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DNO_ENCRYPTION=$(usex !ssl)
	-DENABLE_TESTING=$(usex test)
	)
	cmake-utils_src_configure
}
