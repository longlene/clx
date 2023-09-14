# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit scons-utils

DESCRIPTION="C network daemon for bloom filters"
HOMEPAGE="https://github.com/armon/bloomd"
SRC_URI="https://github.com/armon/bloomd/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	escons
}

src_install() {
	dobin bloomd
	dodoc README.md
}
