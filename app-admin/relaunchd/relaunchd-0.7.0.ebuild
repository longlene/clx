# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An open-source supervisor inspired by launchd"
HOMEPAGE="https://github.com/mheily/relaunchd"
SRC_URI="https://github.com/mheily/relaunchd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-cpp/nlohmann_json
"

src_install() {
	cmake_src_install
	keepdir /var/db/relaunchd
}
