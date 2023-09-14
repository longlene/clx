# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="curses audio visualizer"
HOMEPAGE="http://git.2f30.org/nausea/"
SRC_URI="http://git.2f30.org/nausea/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	sci-libs/fftw:3.0
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/PREFIX =/ s#/local##' \
		-e '/MANPREFIX =/ s#/man#/share/man#' \
		Makefile
}
