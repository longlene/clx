# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MY_PV=${PV/_/-}

DESCRIPTION="A simple, little-overhead, allocation-free and extensible C++ JSON writer"
HOMEPAGE="https://github.com/giacomodrago/minijson_writer"
SRC_URI="mirror://github/giacomodrago/minijson_writer/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins ${PN}.hpp
	dodoc README.md
}
