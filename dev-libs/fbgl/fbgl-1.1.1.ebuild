# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lightweight 2D Framebuffer Graphics Library for Linux"
HOMEPAGE="https://github.com/lvntky/fbgl"
SRC_URI="https://github.com/lvntky/fbgl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	doheader fbgl.h
	einstalldocs
}
