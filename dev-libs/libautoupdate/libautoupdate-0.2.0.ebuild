# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Cross-platform C library that enables your application to auto-update itself in place"
HOMEPAGE="https://github.com/pmq20/libautoupdate"
SRC_URI="https://github.com/pmq20/libautoupdate/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a ${BUILD_DIR}/libautoupdate.a
	insinto /usr
	doins -r include
	dodoc README.md
}
