# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

S="${WORKDIR}"/${PN}-${PV}
DESCRIPTION="biabconverter converts band-in-a-box files to MMA and Lilypond"
HOMEPAGE="http://brenzi.ch/builder.php?content=projects_biabconverter&lang=en"
SRC_URI="http://brenzi.ch/data/biabconverter-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/perl-5"


src_install() {	
	
	dodir /usr/share/biabconverter
	dodir /usr/bin
	cp -r ${S}/* "${D}"usr/share/biabconverter
	#create templates dir
	mkdir "${D}"usr/share/biabconverter/templates
	mv "${D}"usr/share/biabconverter/*.lyt "${D}"usr/share/biabconverter/templates
        #remove install script 
	rm "${D}"usr/share/biabconverter/install
	dosym /usr/share/biabconverter/biabconverter usr/bin/biabconverter
	dodoc README BUGTRACK

}
