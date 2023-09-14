# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Drivers and libraries for the Xbox Kinect device"
HOMEPAGE="http://openkinect.org"
SRC_URI="https://github.com/OpenKinect/libfreenect/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example"

DEPEND="
	virtual/libusb
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "/PROJECT_LIBRARY_INSTALL_DIR/{s#lib#$(get_libdir)#}" cmake_modules/SetupDirectories.cmake
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_EXAMPLES=$(usex example)
	)
	cmake_src_configure
}
