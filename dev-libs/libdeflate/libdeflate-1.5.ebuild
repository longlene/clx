# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
HOMEPAGE="https://github.com/ebiggers/libdeflate"
SRC_URI="https://github.com/ebiggers/libdeflate/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX=${D}/usr LIBDIR=${D}/usr/$(get_libdir) install
}
