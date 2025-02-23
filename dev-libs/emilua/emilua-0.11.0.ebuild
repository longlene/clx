# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Lua execution engine"
HOMEPAGE="https://gitlab.com/emilua/emilua"
SRC_URI="https://gitlab.com/emilua/emilua/-/archive/v0.11.0/emilua-v${PV}.tar.gz -> ${P}.gl.tar.gz"

LICENSE="Boost"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="
	dev-lang/luajit	
	>=dev-libs/boost-1.82.0
	dev-libs/cereal
	dev-libs/libfmt
	dev-libs/serd
	dev-libs/sord
	dev-util/gperf
	dev-util/re2c
	sys-apps/gawk
	sys-libs/liburing
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-v${PV}

src_configure() {
	local emesonargs=(
		$(meson_use doc enable_manpages)
		-Denable_io_uring=true
		-Denable_file_io=true
	)
	meson_src_configure
}
