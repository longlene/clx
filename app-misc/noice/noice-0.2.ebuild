# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="small file browser"
HOMEPAGE="http://git.2f30.org/noice/"
SRC_URI="http://git.2f30.org/noice/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/PREFIX/ s#/local##' \
		-e '/MANPREFIX/ s#man#share/man#' \
		-e '/LDLIBS/ s#$# -ltinfo#' Makefile
	#sed -i '/struct assoc/,/};/ /sh/d;s/less/vim/' config.def.h
	sed -i '/struct assoc/,/\}\;/{/sh/d; s/less/vim/}' config.def.h
}

src_install() {
	dobin noice
	doman noice.1
}
