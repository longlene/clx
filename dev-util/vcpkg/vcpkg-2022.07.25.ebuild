# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++ Library Manager"
HOMEPAGE="https://github.com/microsoft/vcpkg"
SRC_URI="https://github.com/microsoft/vcpkg/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/toolsrc

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DVCPKG_WARNINGS_AS_ERRORS=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/vcpkg
	insinto /usr/share/vcpkg
	doins -r vcpkg/{docs,ports,scripts,triplets,CHANGELOG.md}
}
