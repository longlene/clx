# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils distutils java-pkg-opt-2 python cmake-utils 

ESCRIPTION="Grassroots DiCoM is a C++ library for DICOM medical files."
HOMEPAGE="http://sourceforge.net/projects/gdcm"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples expat java python vtk wxwindows zlib"

RDEPEND="expat? ( dev-libs/expat )
	java? ( >=virtual/jre-1.5 )
	doc? ( app-doc/doxygen )
	python? ( >=dev-lang/python-2.0 dev-lang/swig )
	vtk? ( sci-libs/vtk )
	wxwindows? ( =x11-libs/wxGTK-2.8* )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}
	java? ( >=virtual/jdk-1.5 dev-lang/swig )
	>=dev-util/cmake-2.4"

src_unpack() {
	unpack ${A}
	java-pkg-opt-2_pkg_setup
	cd ${S}
	# disable pdf xml latex output
	epatch ${FILESDIR}/doxygen-nopdf.patch
	sed -i ${S}/Utilities/doxygen/doxyfile.in -e "s|GENERATE_LATEX.*|GENERATE_LATEX=NO|"
	sed -i ${S}/Utilities/doxygen/doxyfile.in -e "s|GENERATE_XML.*|GENERATE_XML=NO|"
}

src_compile() {
	mkdir ${WORKDIR}/build
	cd ${WORKDIR}/build
	
	local CMAKE_VARIABLES="-DCMAKE_SKIP_RPATH:BOOL=YES"
	CMAKE_VARIABLES="${CMAKE_VARIABLES} -DCMAKE_INSTALL_PREFIX:PATH=/usr"
	CMAKE_VARIABLES="${CMAKE_VARIABLES} -DGDCM_BUILD_APPLICATIONS:BOOL=ON"
	CMAKE_VARIABLES="${CMAKE_VARIABLES} -DGDCM_BUILD_SHARED_LIBS:BOOL=ON"
	CMAKE_VARIABLES="${CMAKE_VARIABLES} -DSWIG_DIR:PATH=/usr"
	CMAKE_VARIABLES="${CMAKE_VARIABLES} -DSWIG_EXECUTABLE:FILEPATH=/usr/bin/swig"
	use doc && CMAKE_VARIABLES="${CMAKE_VARIABLES} -DGDCM_DOCUMENTATION:BOOL=ON"
	use examples && CMAKE_VARIABLES="${CMAKE_VARIABLES}	-DGDCM_BUILD_EXAMPLES:BOOL=ON"
	use expat && CMAKE_VARIABLES="${CMAKE_VARIABLES} -DGDCM_USE_SYSTEM_EXPAT:BOOL=ON"
	use zlib && CMAKE_VARIABLES="${CMAKE_VARIABLES}	-DGDCM_USE_SYSTEM_ZLIB:BOOL=ON"
	use java && CMAKE_VARIABLES="${CMAKE_VARIABLES} -DGDCM_WRAP_JAVA:BOOL=ON"
	use python && CMAKE_VARIABLES="${CMAKE_VARIABLES} -DGDCM_WRAP_PYTHON:BOOL=ON"
	use vtk && CMAKE_VARIABLES="${CMAKE_VARIABLES} -DGDCM_USE_VTK:BOOL=ON -DVTK_DIR:PATH=/usr/lib"

	cmake ${S} ${CMAKE_VARIABLES} || die "cmake configuration failed"

	# do not install jar files by cmake, portage will do
	if use java; then
		sed -re "s|FILE\(INSTALL.*||" \
		-i "${WORKDIR}/build/Wrapping/Java/cmake_install.cmake" \
		|| die "Failed to patch java binding install path"
	fi

	# gdcm does not have a setup.py so install these files directly
	if use python; then
		python_version
		sed -e "s|/lib/python/site-packages|/lib/python${PYVER}/site-packages|" -i "${WORKDIR}/build/Wrapping/Python/cmake_install.cmake" \
		|| die "Failed to patch Python binding install path"

		# patch for vtkgdcm's binding is also needed
		if use vtk; then
			sed -e "s|/lib/python/site-packages|/lib/python${PYVER}/site-packages|" -i "${WORKDIR}/build/Utilities/VTK/cmake_install.cmake" \
			|| die "Failed to patch vtkgdcm Python binding install path"
		fi
	fi


	emake -j1 || die "emake failed"
}

src_install() {
	cd ${WORKDIR}/build
	make DESTDIR="${D}" install || die "make install failed"
	
	if use doc; then
		dohtml -r ${WORKDIR}/build/Utilities/doxygen/html/*
		dodoc ${S}/AUTHORS
		dodoc ${S}/Copyright.txt
		dodoc ${S}/README.txt
	fi

	if use java; then
		java-pkg_dojar "${WORKDIR}/build/bin/gdcm.jar"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}/Examples/Cxx
		doins ${S}/Examples/Cxx/*.cxx

		# only install python examples when use python
		if use python; then
			insinto /usr/share/doc/${PF}/Examples/Python
			doins ${S}/Examples/Python/*.py
		fi
	fi
}
