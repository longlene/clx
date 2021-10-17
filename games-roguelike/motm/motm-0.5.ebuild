# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3

DESCRIPTION="Menace of the Mines"
HOMEPAGE="https://sourceforge.net/projects/motm/"
SRC_URI="mirror://sourceforge/project/motm/${PV}/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	sys-libs/ncurses
"
