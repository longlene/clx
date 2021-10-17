# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Portable, user-land SquashFS that can be easily linked and embedded within your application"
HOMEPAGE="https://github.com/pmq20/libsquash"
SRC_URI="https://github.com/pmq20/libsquash/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r include
	doins -r ${BUILD_DIR}/libsquash.a
	dodoc README.md
}
