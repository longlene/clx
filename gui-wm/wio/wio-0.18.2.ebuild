# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Wayland compositor similar to Plan 9's rio"
HOMEPAGE="https://gitlab.com/Rubo/wio"
SRC_URI="https://gitlab.com/Rubo/wio/-/archive/${PV}/${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/wlroots
	x11-libs/cairo
	x11-libs/libdrm
	x11-libs/libxkbcommon
"
RDEPEND="${DEPEND}"
BDEPEND=""
