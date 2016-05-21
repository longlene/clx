# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Embedded JavaScript engine for C/C++"
HOMEPAGE="https://github.com/cesanta/v7"
SRC_URI="https://github.com/cesanta/v7/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	local target="${PN} "
	use example && target+=" examples "
	use test && target+=" test "
	emake ${target}
}

src_install() {
	dobin ${PN}
	dodoc README.md
}
