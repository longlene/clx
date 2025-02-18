# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="5703882e34c104137669d306536c65362413d976"

DESCRIPTION="Portable (POSIX/Windows/Emscripten) thread pool for C/C++"
HOMEPAGE="https://github.com/Maratyszcza/pthreadpool"
SRC_URI="https://github.com/Maratyszcza/pthreadpool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="dev-libs/FXdiv"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${PN}-2022.05.09-gentoo.patch
)

src_configure() {
	local mycmakeargs=(
		-DPTHREADPOOL_LIBRARY_TYPE=shared
		-DPTHREADPOOL_BUILD_BENCHMARKS=OFF
		-DPTHREADPOOL_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}
