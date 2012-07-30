# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Unified framework for finite element assembly"
HOMEPAGE="http://www.fenics.org/wiki/UFC"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	scons \
		|| die "scons failed"
}

src_install() {
	scons install \
	    prefix="/usr" \
		DESTDIR="${D}" \
		|| die "scons install failed"
}
