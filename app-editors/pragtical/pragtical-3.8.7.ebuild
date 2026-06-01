# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="The practical and pragmatic code editor"
HOMEPAGE="
	https://github.com/pragtical/pragtical
	https://pragtical.dev/
"
SRC_URI="https://github.com/pragtical/pragtical/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-lang/luajit
	media-libs/sdl3-image
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		-Duse_system_lua=true
	)
	meson_src_configure
}
