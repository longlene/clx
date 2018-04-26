# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A (very) simple UI lib built on top of OpenCV drawing primitives"
HOMEPAGE="https://github.com/Dovyski/cvui"
SRC_URI="https://github.com/Dovyski/cvui/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/opencv
"

src_install() {
	insinto /usr/include
	doins cvui.h
	dodoc README.md
}
