# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="A small platform independent library making it simple to create and stop new processes in C++"
HOMEPAGE="https://github.com/eidheim/tiny-process-library/"
SRC_URI="https://github.com/eidheim/tiny-process-library/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a ${BUILD_DIR}/libtiny-process-library.a
	insinto porcess.hpp
	dodoc README.md
}
