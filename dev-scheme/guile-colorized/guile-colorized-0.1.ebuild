# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="colorized REPL for GNU Guile"
HOMEPAGE="https://github.com/NalaGinrut/guile-colorized"
SRC_URI="https://github.com/NalaGinrut/guile-colorized/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-scheme/guile
"

src_compile() {
	:
}
src_install() {
	insinto $(guile -c "(display (car %load-path))")/ice-9
	doins ice-9/colorized.scm
	dodoc README.md
}
