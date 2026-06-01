# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Fast Concurrent Memoization Map"
HOMEPAGE="https://github.comgiacomodrago/fcmm"
SRC_URI="https://github.com/giacomodrago/fcmm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins fcmm.hpp
	dodoc README
}
