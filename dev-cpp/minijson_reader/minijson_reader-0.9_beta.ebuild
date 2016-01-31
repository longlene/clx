# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit vcs-snapshot

MY_PV=${PV/_/-}

DESCRIPTION="A DOM-less JSON parser that can parse a JSON object without allocating a single byte of memory"
HOMEPAGE="https://github.com/giacomodrago/minijson_reader"
SRC_URI="mirror://github/giacomodrago/minijson_reader/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
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
