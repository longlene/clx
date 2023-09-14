# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="VisionLab Features Library"
HOMEPAGE="https://www.vlfeat.org"
SRC_URI="https://www.vlfeat.org/download/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	if use amd64 ; then
		ARCH=glnxa64
	elif use x86 ; then
		ARCH=glnx86
	fi
}

src_install() {
	dobin bin/${ARCH}/{sift,mser}
	doman src/{vlfeat.7,mser.1,sift.1}
	dolib.so bin/${ARCH}/libvl.so
	insinto /usr/include
	doins -r vl
	dodoc README.md
}
