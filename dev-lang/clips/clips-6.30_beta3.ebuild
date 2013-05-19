# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base

DESCRIPTION="A Tool for Building Expert Systems"
HOMEPAGE="http://clipsrules.sourceforge.net/"
SRC_URI="http://const.mimas.ru/distfiles/${P}.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RESTRICT="mirror"

src_install() {
	base_src_install
	use doc && dodoc doc/*.doc
}
