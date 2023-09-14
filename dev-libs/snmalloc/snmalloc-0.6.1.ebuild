# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Message passing based allocator"
HOMEPAGE="https://github.com/microsoft/snmalloc"
SRC_URI="https://github.com/microsoft/snmalloc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dolib.so ${BUILD_DIR}/libsnmallocshim.so
	dodoc README.md
}

