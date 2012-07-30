# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $ Header: $

# This represents the original version used with the netgen45ForSalome.patch
# from the Salome 3.2.6 / netgenplugin source
# netgen dated 2006-02-14 from CVS
# this can be sourced from CVS via
# cvs -d :ext:netgen@thor.sfb013.uni-linz.ac.at:/cvs/netgen co -D "01 Mar 2006" netgen
# however you will need to dig through the netgen mailing list for the cvs password
# as there is no anonymous access

# another thing to look out for is that the original netgen45ForSalome.patch
# series of patches had dos line breaks which needed to be removed

inherit eutils toolchain-funcs versionator flag-o-matic multilib

MY_P="ngs45rc2"

DESCRIPTION="NETGEN is an automatic 3d tetrahedral mesh generator"
HOMEPAGE="http://www.hpfem.jku.at/netgen/"
SRC_URI="${MY_P}_src.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE="opencascade lapack gmp"
SLOT="0"
RESTRICT="fetch"

RDEPEND="opencascade? ( sci-libs/opencascade )
	gmp? ( dev-libs/gmp )
	virtual/opengl
	>=dev-lang/tk-8.0
	>=dev-lang/tcl-8.0
	>=dev-tcltk/tix-8.1
	x11-libs/libXmu "

DEPEND="${RDEPEND}
	lapack? ( dev-util/pkgconfig )"

S="${WORKDIR}/netgen"

pkg_nofetch()
{
	einfo "You have to download manually the source code. You can download it from :"
	einfo "   http://www.mathcces.rwth-aachen.de/netgen/doku.php"
	einfo ""
	einfo "Put the archive in the \"/usr/portage/distfile\" directory and rename it \"ngs45rc2_src.tar.gz\""
}

src_unpack() {
	unpack ${A}
	cd ${WORKDIR}
	mv ${MY_P} netgen
	cd "${S}"
	# Misc patches
	epatch "${FILESDIR}"/netgen-4.5-2006-03-01-togl_tk.patch
	epatch "${FILESDIR}"/meshtype.patch
	epatch "${FILESDIR}"/densemat.patch
	
	# use the 4.5rc2 source file and revert backwards via a patch
	epatch "${FILESDIR}/netgen-4.5-2006-03-01-revert.patch.bz2"

	if use opencascade ; then
		# add in the salome patch
		epatch "${FILESDIR}/netgen-4.5-2006-03-01-salome.patch.bz2"
		if use amd64 ; then
			epatch "${FILESDIR}/netgen-4.5-2006-03-01-salomelib64.patch.bz2"
		fi
		epatch "${FILESDIR}/netgen-4.5-2006-03-01-fix1.patch"
		# Done normally as part of the salome make script
		cp ngtcltk/ngnewdelete.* libsrc/interface/
	fi
}

src_compile() {
	cd "${S}"
	local LAPACK="-lg2c"
	export MACHINE="LINUX"

	# This doesn't appear to work at the moment
	#if use amd64 ; then
	#	export MACHINE="LINUX64"
	#fi
	
	export NETGENDIR="/usr/share/netgen"
	# gcc>=4.0 does not have libg2c anymore
	if version_is_at_least "4.0" $(gcc-version) ; then
		 LAPACK=""
	fi

	# Fix the Makefiles
	local tk_version
	tk_version=$(grep TK_VER /usr/include/tk.h | sed 's/^.*"\(.*\)".*/\1/')
	local tk_release_serial
	tk_release_serial=$(grep TK_RELEASE_SERIAL /usr/include/tk.h | awk '{print $3}')
	local tix_version
	tix_version=$(grep TIX_VER /usr/include/tix.h | sed 's/^.*"\(.*\)".*/\1/')

	# The install location of libtix has changed from 8.2* to 8.4
	if version_is_at_least "8.4" ${tix_version} ; then
		tix_patch_level=$(sed -n '/TIX_PATCH_LEVEL/p' /usr/include/tix.h | sed -n '1p' | sed 's/^.*"\(.*\)".*/\1/')
		sed -i -e "s:-ltix8.1.8.4:-L/usr/$(get_libdir)/Tix${tix_patch_level} -lTix${tix_patch_level}:g" ./Makefile
	else
		sed -i -e 's:tix8.1.8.4:tix:g' ./Makefile
	fi

	sed -i \
	    -e 's:tcl8.4:tcl:g' \
	    -e 's:tk8.4:tk:g' \
		-e "s:CPP_DIR=.:CPP_DIR=${S}:g" ./Makefile \
	|| die "Correction of the tcl/tk flags and CPP_DIR value in Makefile failed"

	sed -i \
	    -e "s:-O2:${CXXFLAGS}:g" \
	    -e 's:/usr/include/GL3.5:/usr/include/GL:g' \
	    -e "s:-L/usr/openwin/lib -L/usr/X11R6/lib -L/usr/lib/GL3.5:-L/usr/X11R6/$(get_libdir) -L/usr/$(get_libdir)/GL:g" ./libsrc/makefile.mach.LINUX \
	|| die "Correction of the GL patch in libsrc/makefile.mach.LINUX failed"

	if use opencascade; then
		sed -i \
		    -e "s:/opt/OpenCASCADE5.2:$CASROOT/../:g" \
		    -e "s:/ros/lin/lib:/ros/lin/$(get_libdir):g" ./Makefile ./libsrc/makefile.mach.LINUX \
		|| die "Correction of the OpenCascade location in Makefile and libsrc/makefile.mach.LINUX failed"
	else
		sed -i \
		    -e 's:OCC_DIR=/opt/OpenCASCADE5.2:# OCC_DIR=/opt/OpenCASCADE5.2:g' \
		    -e "s:OCCINC_DIR=\$(OCC_DIR)/ros/inc:# OCCINC_DIR=\$(OCC_DIR)/ros/inc:g" \
		    -e "s:OCCLIB_DIR=\$(OCC_DIR)/ros/lin/lib:# OCCLIB_DIR=\$(OCC_DIR)/ros/lin/lib:g" ./Makefile ./libsrc/makefile.mach.LINUX \
		|| die "Commenting out of OpenCascade in Makefile and libsrc/makefile.mach.LINUX failed"
		sed -i \
		    -e 's:CPLUSPLUSFLAGS2 += -DOCCGEOMETRY -DOCC52 -DUSE_STL_STREAM -DHAVE_IOSTREAM -DHAVE_LIMITS -I\$(OCCINC_DIR):# CPLUSPLUSFLAGS2 += -DOCCGEOMETRY -DOCC52 -DUSE_STL_STREAM -DHAVE_IOSTREAM -DHAVE_LIMITS -I\$(OCCINC_DIR):g' \
		    -e 's:LINKFLAGS2 += -L\$(OCCLIB_DIR) -lTKIGES -lTKBRep -lTKSTEP -lTKSTL -lTKTopAlgo -lTKG3d -lTKG2d -lTKXSBase -lTKOffset -lTKFillet -lTKGeomBase -lTKGeomAlgo -lTKShHealing -lTKBO -lTKPrim -lTKernel -lTKMath -lTKBool:# LINKFLAGS2 += -L\$(OCCLIB_DIR) -lTKIGES -lTKBRep -lTKSTEP -lTKSTL -lTKTopAlgo -lTKG3d -lTKG2d -lTKXSBase -lTKOffset -lTKFillet -lTKGeomBase -lTKGeomAlgo -lTKShHealing -lTKBO -lTKPrim -lTKernel -lTKMath -lTKBool:g' ./libsrc/makefile.mach.LINUX \
		|| die "Commenting out of OpenCascade C++ and Link flags in libsrc/makefile.mach.LINUX failed"
		sed -i \
		    -e 's:-locc::g' \
		    -e 's:occlib:# occlib:g' ./Makefile \
		|| die "Commenting out of OpenCascade in Makefile failed"
	fi

	use lapack && LAPACK="${LAPACK} $(pkg-config --libs lapack)"
	use gmp    && LAPACK="${LAPACK} -lgmp"

	sed -i \
	    -e "s:# lapack =  -llapack  -lblas -lgmp -lg2c:lapack = ${LAPACK}:g" ./Makefile ./libsrc/makefile.mach.LINUX \
	|| die "Lapack setup failed"

	# Copy tkInt.h from the system to the source to correct the issue with togl.cpp
	cp -p /usr/$(get_libdir)/tk${tk_version}/include/generic/tkInt.h ./togl/tkInt${tk_version}p${tk_release_serial}.h
	cp -p /usr/$(get_libdir)/tk${tk_version}/include/generic/tkIntDecls.h ./togl/tkIntDecls${tk_version}p${tk_release_serial}.h
	sed -i \
	    -e "s:tkIntDecls.h:./tkIntDecls${tk_version}p${tk_release_serial}.h:g" ./togl/tkInt${tk_version}p${tk_release_serial}.h \
	|| dies "togl.cpp vs. tkInt.h issue correction failed"

	# Build 2 extra demo applications
	#sed -i \
	#    -e "s:# appdemo:appdemo:g" \
	#    -e "s:# appaddon:appaddon:g" \
	#    -e "s:# appngs:appngs:g" \
	#    -e "s:#	cd demoapp:	cd demoapp:g" \
	#    -e "s:#	cd ngsolve:	cd ngsolve:g" ./Makefile \
	#|| die "Extra demo applications. 'sed' failed"

	emake || die "make failed"
}

src_install() {
	cd "${S}"
	# The binaries
	dobin ng
	# The libraries
	dolib ./lib/LINUX/*.a ./lib/LINUX/*.so*
	# The docs
	dodoc ./doc/ng4.pdf VERSION

	# Headers original method
	# The headers
	#dodir /usr/include/${PN}
	#insinto /usr/include/${PN}
	#doins ./libsrc/include/*.hpp
	# Ngsolve headers
	#dodir /usr/include/${PN}/ngsolve
	#insinto /usr/include/${PN}/ngsolve
	#doins ./ngsolve/*.hpp

	#for headers_dir in \
	#csg general geom2d gprim interface linalg \
	#meshing opti stlgeom visualization; do
	#	dodir /usr/include/${PN}/${headers_dir}
	#	insinto /usr/include/${PN}/${headers_dir}
	#	doins ./libsrc/${headers_dir}/*.hpp
	#done

	#if use opencascade; then
	#	dodir /usr/include/${PN}/occ
	#	insinto /usr/include/${PN}/occ
	#	doins ./libsrc/occ/*.hpp
	#fi

	# Salome netgen plugin expects the headers to be in a slightly diferent place
	# implimenting this as a workaround until things settle down with netgen / salome
	dodir /usr/include/${PN}
	insinto /usr/include/${PN}
	doins ./libsrc/interface/nglib.h ./libsrc/general/*.hpp ./libsrc/csg/*.hpp
	doins ./libsrc/geom2d/*.hpp ./libsrc/gprim/*.hpp ./libsrc/linalg/*.hpp ./libsrc/meshing/*.hpp
	doins ./libsrc/occ/*.hpp ./libsrc/opti/*.hpp ./libsrc/include/mydefs.hpp
	doins ./libsrc/stlgeom/*.hpp ./libsrc/include/mystdlib.h

	# The misc shared files
	dodir /usr/share/doc/${PF}
	insinto /usr/share/doc/${PF}
	find . -name "*.tcl" -exec doins {} \;
	dodir /usr/share/doc/${PF}/tutorials
	insinto /usr/share/doc/${PF}/tutorials
	doins ./tutorials/*

	# Install icon and .desktop for menu entry
	doicon "${FILESDIR}"/icon/${PN}-icon.png
	domenu "${FILESDIR}"/icon/${PN}.desktop
}

pkg_postinst() {
	einfo "Netgen ebuild needs further development. Please inform any problems or improvements in http://bugs.gentoo.org/show_bug.cgi?id=155424"
}

