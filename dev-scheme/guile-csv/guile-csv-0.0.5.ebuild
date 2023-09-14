# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Guile csv reader"
HOMEPAGE="https://github.com/NalaGinrut/guile-csv"
SRC_URI="https://github.com/NalaGinrut/guile-csv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto $(guile -c "(display (car %load-path))")
	doins -r csv
	dodoc README
}
