# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="C++ Template Image Processing Toolkit"
HOMEPAGE="https://github.com/dtschump/CImg"
SRC_URI="mirror://github/dtschump/CImg/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CeCILL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins CImg.h
}
