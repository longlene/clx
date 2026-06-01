# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A library for working with sets of tasks in parallel"
HOMEPAGE="https://github.com/facebookincubator/dispenso"
SRC_URI="https://github.com/facebookincubator/dispenso/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/concurrentqueue
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DDISPENSO_USE_SYSTEM_CONCURRENTQUEUE=ON
	)
	cmake_src_configure
}
