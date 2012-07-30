# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

IUSE=""

DESCRIPTION="Zmixer is a simple volume control which based on gtk"
HOMEPAGE="http://zwin.org/projects/zmixer"
SRC_URI="http://zwin.org/projects/zmixer/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 x86"

DEPEND="=x11-libs/gtk+-2*"

src_compile() {
	cd ${P}

sed -i \
	-e "s:PREFIX = /prog/zmixer:PREFIX = /usr:" \
	-e "s:RUNDIR = /prog/zmixer/run:RUNDIR = /usr/bin:" \
	Makefile

	emake || die
}

src_install() {
	dobin zmixer
}
	