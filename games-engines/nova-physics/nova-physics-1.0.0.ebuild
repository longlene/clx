# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Lightweight 2D rigid-body physics engine"
HOMEPAGE="https://github.com/kadir014/nova-physics"
SRC_URI="https://github.com/kadir014/nova-physics/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		-Dbuild_examples=false
		-Dbuild_tests=false
	)
	meson_src_configure
}

src_install() {
	insinto /usr/include
	doins -r include/novaphysics
	dolib.a ${BUILD_DIR}/libnova.a
	einstalldocs
}
