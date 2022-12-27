# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A lightweight text editor written in Lua"
HOMEPAGE="https://lite-xl.com/"
SRC_URI="https://github.com/lite-xl/lite-xl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-lang/lua
	media-libs/libsdl2
	media-libs/freetype
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	# just to remove installation warning
	sed -e '/install_data/{/lite_docdir/d}' \
		-i meson.build
}
