# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="lightweight scheme interpreter"
HOMEPAGE="https://github.com/picrin-scheme/picrin/"
SRC_URI="https://github.com/picrin-scheme/picrin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r extlib/benz/include
	dolib.a lib/libbenz.a
	dobin bin/${PN}
	dodoc README.md
}
