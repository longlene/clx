# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

MY_PV="${PV//./-}"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/karastojko/mailio/archive/version_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DMAILIO_BUILD_DOCUMENTATION=OFF
	-DMAILIO_BUILD_EXAMPLES=OFF
	)
	cmake-utils_src_configure
}
