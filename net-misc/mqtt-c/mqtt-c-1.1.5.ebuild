# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="A portable MQTT C client for embedded systems and PCs alike"
HOMEPAGE="https://github.com/LiamBindle/MQTT-C"
SRC_URI="https://github.com/LiamBindle/MQTT-C/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DMQTT_C_EXAMPLES=OFF
	)
	cmake_src_configure
}
