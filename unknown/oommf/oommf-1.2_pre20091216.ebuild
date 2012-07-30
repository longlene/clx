# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Original ebuild by B. Catherman, modified by M. Sears

inherit eutils

DESCRIPTION="A broad public-domain micromagnetics toolset, originally developed at NIST.  Written in C++ with a Tcl/Tk interface."
HOMEPAGE="http://math.nist.gov/oommf"
SRC_URI="http://math.nist.gov/oommf/snapshot/oommf12a4pre-20091216.tar.gz"
LICENSE="Unknown"

SLOT="1.2"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=" ( dev-lang/tcl )
         ( dev-lang/tk ) "


S=${WORKDIR}/oommf12a4pre-20091216/


src_unpack() {
	unpack ${A}
}

src_compile() {
	cd ${S}
	tclsh oommf.tcl pimake distclean || die
	tclsh oommf.tcl pimake upgrade || die
	tclsh oommf.tcl pimake || die
	echo "#!/bin/sh" > 50oommf
	echo "OOMMF_ROOT=/opt/oommf" >> 50oommf
}


src_install() {
	doenvd 50oommf

	dodir /opt/oommf-${PV}
	
	for i in "app pkg doc config tests" ; do
		cp -PR $i ${D}/opt/oommf-${PV}/
	done 
	
	insinto /opt/oommf-${PV}
	exeinto /opt/oommf-${PV}
	doins CHANGES Changes.txt LICENSE makerules.tcl oommf.ico README Readme.txt
	doexe oommf.tcl
}
