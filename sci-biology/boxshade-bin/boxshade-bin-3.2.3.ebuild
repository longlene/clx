# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Boxshade is a program for creating good looking printouts from multiple-aligned protein or DNA sequences."
HOMEPAGE="http://downloads.sourceforge.net/boxshade/"
SRC_URI="http://downloads.sourceforge.net/boxshade/boxshade-${PV}.tar.gz"

LICENSE="GPL" # actually public domain, see /usr/share/doc/boxshade-bin-3.2.3/boxshade-3.2.2.txt.bz2
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_compile() {
	# FIXME: the tool is written in pascal so we need pc compiler!!!
	# make box
	wget http://downloads.sourceforge.net/boxshade/box_3.2.3_linux_i386.bin
}

src_install() {
	cd ${S}
	insinto /usr/bin
	newbin box_3.2.3_linux_i386.bin boxshade
	dodir /usr/share/boxshade
	cd ${S}/boxshade-${PV}
	insinto /usr/share/boxshade
	doins *.par *.sim *.grp
	newdoc boxshad3.txt boxshade-3.2.2.txt
}
