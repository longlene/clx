# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A library for the Guile Scheme interpreter that provides functions for creating text user interfaces"
HOMEPAGE="https://www.gnu.org/software/guile-ncurses/"
SRC_URI="http://ftp.gnu.org/gnu/${PN}/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"
