# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="OOMMF is a project in the Mathematical and Computational Sciences
Division (MCSD) of ITL/NIST, in close cooperation with MAG, aimed at developing
portable, extensible public domain programs and tools for micromagnetics. The
end product will be a fully functional micromagnetic code, with a well
documented, flexible programmer's interface to allow developers outside the
OOMMF project to swap their own code in and out as desired. The guts of the code
are being written in C++ with a Tcl/Tk (and in the future, possibly OpenGL)
interface. Target systems include a wide range of Unix platforms and Windows (9x
and later). The open source scripting language Tcl/Tk is required to run OOMMF."
HOMEPAGE="http://math.nist.gov/oommf"
SRC_URI="http://math.nist.gov/oommf/dist/oommf12a3_20021030.tar.gz"
LICENSE="Unknown"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=" ( dev-lang/tcl )
         ( dev-lang/tk ) "


S=${WORKDIR}/oommf

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/1.2-r1-clktck-evoc-20021119.patch || die
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
