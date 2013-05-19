# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A Tool for Building Expert Systems"
HOMEPAGE="http://www.ghg.net/clips/CLIPS.html"
SRC_URI="http://www.ghg.net/clips/download/archive/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

src_install() {
	emake DESTDIR="${D}" install || die
}
