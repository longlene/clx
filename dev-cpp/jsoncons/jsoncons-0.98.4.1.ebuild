# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="C++ library for parsing and serializing JSON text"
HOMEPAGE="http://danielaparker.github.io/jsoncons"
SRC_URI="https://github.com/danielaparker/jsoncons/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r src/${PN} src/${PN}_ext
	dodoc README.md
}
