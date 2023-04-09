# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C++ library for conversion between big and little endian data representations"
HOMEPAGE="https://github.com/steinwurf/endian"
SRC_URI="https://github.com/steinwurf/endian/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r src/endian
	einstalldocs
}
