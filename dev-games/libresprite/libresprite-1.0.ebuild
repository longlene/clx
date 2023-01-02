# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Animated sprite editor & pixel art tool"
HOMEPAGE="https://libresprite.github.io/"
SRC_URI="
	https://github.com/LibreSprite/LibreSprite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/aseprite/clip/archive/a65a9e543e9a270bb7c58789d15d027bbd8efb2a.tar.gz -> clip-a65a9e543e9a270bb7c58789d15d027bbd8efb2a.tar.gz
	https://github.com/aseprite/flic/archive/65a6072fa0aa611c383b44d21b87d41e2ea8b523.tar.gz -> flic-65a6072fa0aa611c383b44d21b87d41e2ea8b523.tar.gz
	https://github.com/dacap/observable/archive/89c97405025c17fbce5b147aae86fe35b00f98e5.tar.gz -> observable-89c97405025c17fbce5b147aae86fe35b00f98e5.tar.gz
	https://github.com/aseprite/undo/archive/f39b188e29d0f9adaa49c8705c0f492939d967a9.tar.gz -> undo-f39b188e29d0f9adaa49c8705c0f492939d967a9.tar.gz
	https://github.com/libresprite/duktape/archive/6f715553e706b61e611aa4ae8e6fe90626800dae.tar.gz -> duktape-6f715553e706b61e611aa4ae8e6fe90626800dae.tar.gz
	https://github.com/aseprite/simpleini/archive/0687587cef1816a04307d632e517be9803bbdca6.tar.gz -> simpleini-0687587cef1816a04307d632e517be9803bbdca6.tar.gz
"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/gtest
	dev-lang/lua:5.4
	dev-libs/tinyxml
	media-libs/freetype
	media-libs/giflib
	media-libs/libpng
	media-libs/sdl2-image
	net-misc/curl[ssl]
	virtual/jpeg
	x11-libs/pixman
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir src/clip && ln -sv "${WORKDIR}"/clip-a65a9e543e9a270bb7c58789d15d027bbd8efb2a src/clip
	rmdir src/flic && ln -sv "${WORKDIR}"/flic-65a6072fa0aa611c383b44d21b87d41e2ea8b523 src/flic
	rmdir src/observable && ln -sv "${WORKDIR}"/observable-89c97405025c17fbce5b147aae86fe35b00f98e5 src/observable
	rmdir src/undo && ln -sv "${WORKDIR}"/undo-f39b188e29d0f9adaa49c8705c0f492939d967a9 src/undo
	rmdir third_party/duktape && ln -sv "${WORKDIR}"/duktape-6f715553e706b61e611aa4ae8e6fe90626800dae third_party/duktape
	rmdir third_party/simpleini&& ln -sv "${WORKDIR}"/simpleini-0687587cef1816a04307d632e517be9803bbdca6 third_party/simpleini
	sed -e '/DESTINATION/{s#share/appdata#share/metainfo#}' \
		-i desktop/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_DESKTOP_INTEGRATION=ON
	)
	cmake_src_configure
}
