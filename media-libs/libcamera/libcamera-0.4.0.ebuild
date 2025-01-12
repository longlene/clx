# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A complex camera support library"
HOMEPAGE="https://gitlab.freedesktop.org/camera/libcamera"
SRC_URI="https://gitlab.freedesktop.org/camera/libcamera/-/archive/v${PV}/libcamera-v${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gstreamer python qt6 udev v4l2"

DEPEND="
	dev-libs/libyaml
	|| ( net-libs/gnutls dev-libs/openssl )
	udev? ( virtual/udev )
	gstreamer? ( media-libs/gstreamer )
	qt6 ( dev-qt/qtbase:6 )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-v${PV}

src_configure() {
	local emesonargs=(
		-Ddocumentation=disabled
		$(meson_feature gstreamer)
		-Dlc-compliance=disabled
		$(meson_feature python pycamera)
		$(meson_feature qt6 qcam)
		$(meson_feature udev)
		$(meson_use v4l2)
	)
	meson_src_configure
}
