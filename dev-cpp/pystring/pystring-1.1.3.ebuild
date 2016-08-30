# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="C++ functions matching the interface and behavior of python string methods with std::string"
HOMEPAGE="https://github.com/imageworks/pystring"
SRC_URI="https://github.com/imageworks/pystring/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins pystring.h
	dolib.so .libs/lib${PN}.so*
	dodoc README
}
