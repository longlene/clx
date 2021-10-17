# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="BearLibTerminal provides a pseudoterminal window with a grid of character cells and a simple yet powerful API for flexible textual output and uncomplicated input processing"
HOMEPAGE="https://bitbucket.org/cfyzium/bearlibterminal"
SRC_URI="https://bitbucket.org/cfyzium/bearlibterminal/get/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/opengl"
RDEPEND="${DEPEND}"

src_install() {
	dolib.so Output/*/*.so
	insinto /usr/include
	doins Terminal/Include/C/BearLibTerminal.h
	dodoc README.md
}
