# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Multi-protocol Port Mapping client library"
HOMEPAGE="https://github.com/paullouisageneau/libplum"
SRC_URI="https://github.com/paullouisageneau/libplum/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/plum
	dolib.so ${BUILD_DIR}/libplum.so*
	einstalldocs
}
