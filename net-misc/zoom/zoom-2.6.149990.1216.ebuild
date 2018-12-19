# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-minimal

DESCRIPTION="#1 Video Conferencing and Web Conferencing Service"
HOMEPAGE="https://zoom.us/"
SRC_URI="
	abi_x86_32? ( https://zoom.us/client/${PV}/zoom_i686.tar.xz -> ${P}-i686.tar.xz )
	abi_x86_64? ( https://zoom.us/client/${PV}/zoom_x86_64.tar.xz -> ${P}-x86_64.tar.xz )
"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/glib
	media-libs/fontconfig
	media-libs/mesa
	media-sound/pulseaudio
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libXcomposite
	x11-libs/libxshmfence
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	dev-qt/qtquickcontrols2:5
	dev-qt/qtsvg:5
	dev-qt/qtwebengine:5
"
BDEPEND=""

S="${WORKDIR}"/zoom

src_install() {
	insinto /opt/${PN}
	doins -r ./*
	dosym /opt/${PN}/ZoomLauncher /usr/bin/zoom

	insinto /usr/share/mime/packages
	doins ${FILESDIR}/zoom.xml
	insinto /usr/share/pixmaps/
	doins ${FILESDIR}/{Zoom,application-x-zoom}.png

	domenu ${FILESDIR}/zoom.desktop
}
