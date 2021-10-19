# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="FlatBuffers Compiler and Library in C for C"
HOMEPAGE="https://github.com/dvidelabs/flatcc/"
SRC_URI="https://github.com/dvidelabs/flatcc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/flatcc
	dodoc README.md
}
