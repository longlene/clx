# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="A rewrite of the traditional/vanilla version of Angband"
HOMEPAGE="http://langband.sourceforge.net/"
SRC_URI="http://prdownloads.sourceforge.net/langband/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/libsdl
	media-libs/sdl-image
"
