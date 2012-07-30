# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

ECVS_SERVER="boomerang.cvs.sourceforge.net:/cvsroot/boomerang"
ECVS_MODULE="boomerang"
ECVS_USER="anonymous"
ECVS_PASS=""
ECVS_CVS_OPTIONS="-dP"

inherit cvs eutils

S=${WORKDIR}/${ECVS_MODULE}

DESCRIPTION="A general, open source, retargetable decompiler of machine code programs - (sources from CVS)."
HOMEPAGE="http://boomerang.sourceforge.net"
SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="-* ~x86"
IUSE="qt4 examples"

DEPEND="dev-libs/boehm-gc
	dev-libs/expat
	dev-util/cppunit
        qt4? ( >=x11-libs/qt-4.1.2 )" 


pkg_setup() {
	if built_with_use dev-libs/boehm-gc nocxx; then
		eerror "We need dev-libs/boehm-gc without nocxx enabled"
		einfo "Recompile dev-libs/boehm-gc with use=\"-nocxx\""
		die "Need cxx-support in dev-libs/boehm-gc"
	fi


        ewarn "This is a LIVE CVS ebuild."
        ewarn "That means there are NO promises it will work."
        ewarn "If it fails to build, FIX THE CODE YOURSELF"
        ewarn "before reporting any issues."
}

src_unpack() {
        cvs_src_unpack
}

src_compile() {
        econf || die "econf failed."

        emake remote || die "emake remote failed"

        emake || die "emake failed"
        emake || die "emake failed"

	if use qt4; then
		cd qtgui2
		qmake -project qtgui2-unx.pro
		qmake qtgui2-unx.pro
		emake || die "emake failed. try building without qt4 use flag."
	fi
}

src_install() {
	into /usr/local/boomerang

	##bin
	dodir ${DESTTREE}/bin	

	dobin boomerang
	dosym bin/boomerang ${DESTTREE}/boomerang

	##startscript for main binary
	dobin ${FILESDIR}/startboomerang.sh
	dosym ${DESTTREE}/bin/startboomerang.sh /usr/bin/boomerang

	if use qt4; then
		##qt binary
		newbin qtgui2/qtgui2-unx boomerang-qt

		dosym bin/boomerang-qt ${DESTTREE}/boomerang-qt

		##startscript for qt binary
		dobin ${FILESDIR}/startboomerang-qt.sh
		dosym ${DESTTREE}/bin/startboomerang-qt.sh /usr/bin/boomerang-qt


		##bmp images
		insinto ${DESTTREE}
		doins *.bmp
	fi
	
	##lib
	dodir ${DESTTREE}/lib

	dolib lib/*.so
	dosym ${DESTTREE}/lib/libBinaryFile.so /usr/lib/libBinaryFile.so


	##licence file
	dodir ${DESTTREE}/licence
	insinto ${DESTTREE}/licence

	doins LICENSE.TERMS	


	##signatures
	dodir ${DESTTREE}/signatures
	insinto ${DESTTREE}/signatures
	
	doins signatures/*.hs
	doins signatures/*.h

	##transformations
	dodir ${DESTTREE}/transformations
	insinto ${DESTTREE}/transformations
	
	doins transformations/*.t
	

	##frontend - ppc
	dodir ${DESTTREE}/frontend/machine/ppc
	insinto ${DESTTREE}/frontend/machine/ppc
	
	doins frontend/machine/ppc/ppc.ssl


	##frontend - hppa
	dodir ${DESTTREE}/frontend/machine/hppa
	insinto ${DESTTREE}/frontend/machine/hppa
	
	doins frontend/machine/hppa/hppa.ssl


	##frontend - st20
	dodir ${DESTTREE}/frontend/machine/st20
	insinto ${DESTTREE}/frontend/machine/st20
	
	doins frontend/machine/st20/st20.ssl


	##frontend - mc68k
	dodir ${DESTTREE}/frontend/machine/mc68k
	insinto ${DESTTREE}/frontend/machine/mc68k
	
	doins frontend/machine/mc68k/mc68k.ssl


	##frontend - sparc
	dodir ${DESTTREE}/frontend/machine/sparc
	insinto ${DESTTREE}/frontend/machine/sparc
	
	doins frontend/machine/sparc/sparc.ssl


	##frontend - pentium
	dodir ${DESTTREE}/frontend/machine/pentium
	insinto ${DESTTREE}/frontend/machine/pentium
	
	doins frontend/machine/pentium/pentium.ssl


	##examples, rm is used to exclude CVS folders. maybe there's a better way
	if use examples; then
		##examples - elf32-ppc
		dodir ${DESTTREE}/test/elf32-ppc
		insinto ${DESTTREE}/test/elf32-ppc
		
		rm -rf test/elf32-ppc/CVS
		doins test/elf32-ppc/*


		##examples - hppa
		dodir ${DESTTREE}/test/hppa
		insinto ${DESTTREE}/test/hppa
		
		rm -rf test/hppa/CVS
		doins test/hppa/*


		##examples - mc68328
		dodir ${DESTTREE}/test/mc68328
		insinto ${DESTTREE}/test/mc68328
		
		rm -rf test/mc68328/CVS
		doins test/mc68328/*


		##examples - mips
		dodir ${DESTTREE}/test/mips
		insinto ${DESTTREE}/test/mips
		
		rm -rf test/mips/CVS
		doins test/mips/*


		##examples - OSX
		dodir ${DESTTREE}/test/OSX
		insinto ${DESTTREE}/test/OSX
		
		rm -rf test/OSX/CVS
		doins test/OSX/*


		##examples - pentium
		dodir ${DESTTREE}/test/pentium
		insinto ${DESTTREE}/test/pentium
		
		rm -rf test/pentium/CVS
		doins test/pentium/*


		##examples - ppc
		dodir ${DESTTREE}/test/ppc
		insinto ${DESTTREE}/test/ppc
		
		rm -rf test/ppc/CVS
		doins test/ppc/*


		##examples - source code of examples
		dodir ${DESTTREE}/test/source
		insinto ${DESTTREE}/test/source
		
		rm -rf test/source/CVS
		doins test/source/*


		##examples - sparc
		dodir ${DESTTREE}/test/sparc
		insinto ${DESTTREE}/test/sparc
		
		rm -rf test/sparc/CVS
		doins test/sparc/*


		##examples - windows
		dodir ${DESTTREE}/test/windows
		insinto ${DESTTREE}/test/windows
		
		rm -rf test/windows/CVS
		doins test/windows/*
	fi

	##end of src_install
}

pkg_postinst() {
	einfo "You may now start boomerang by typing \"boomerang\"."

	if use qt4; then
		einfo "You also request the qt4-gui. You may start it by typing \"boomerang-qt\"."
	fi

	if use examples; then
		einfo "Examples to test decompilation have been put into /usr/local/boomerang/test (including original source)"
	fi
}
