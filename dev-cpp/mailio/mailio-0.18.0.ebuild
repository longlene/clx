# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

MY_PV="${PV//./-}"

SRC_URI="https://github.com/karastojko/mailio/archive/version_${MY_PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DMAILIO_BUILD_DOCUMENTATION=OFF
	-DMAILIO_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
