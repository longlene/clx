# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="PE file manipulation library"
HOMEPAGE="https://github.com/avast-tl/pelib"
SRC_URI="https://github.com/avast-tl/pelib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/pelib
	dolib.a ${BUILD_DIR}/src/pelib/libpelib.a
	dodoc README.md
}
