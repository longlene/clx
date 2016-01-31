# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="sprintf accelerator for GCC and Clang"
HOMEPAGE="https://github.com/h2o/qrintf"
SRC_URI="https://github.com/h2o/qrintf/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	dobin bin/qrintf bin/qrintf-pp

	insinto /usr/include
	doins include/qrintf.h

	insinto /usr/share/qrintf
	doins share/qrintf/gcc-wrapper

	dodoc README.md

}
