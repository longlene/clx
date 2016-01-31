# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A fast monolithic-architecture web-framework of Scheme language"
HOMEPAGE="http://web-artanis.com"
SRC_URI="https://github.com/NalaGinrut/artanis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-scheme/guile
	dev-scheme/guile-dbi
"

src_install() {
	insinto $(guile -c "(display (%site-dir))")
	doins -r artanis
	insinto $(guile -c "(display (%site-ccache-dir))")
	doins -r obj/artanis
	insinto /etc
	doins -r etc/artanis
	insinto /etc/artanis
	doins -r pages
	dobin bin/art
	if use bash-completion ; then
		newbashcomp build-aux/show-cmds.sh art
	fi
	if use doc ; then
		doinfo artanis.info
	fi
	dodoc README.md
}
