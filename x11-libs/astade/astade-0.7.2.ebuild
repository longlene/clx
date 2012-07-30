# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SLOT="0"
LICENSE="GPL-1"
KEYWORDS="~x86"
DESCRIPTION="UML tool for C++ code generation"
SRC_URI="http://astade.tigris.org/files/documents/2839/37806/${P}.tar.gz"
HOMEPAGE="http://www.astade.de"
IUSE=""
DEPEND=">=x11-libs/wxGTK-2.6 >=sys-devel/gcc-3.2"
RDEPEND="${DEPEND} media-gfx/graphviz"

SOURCE_DIR=${S}/Source
INSTALL_DIR=/opt/Astade

src_compile() {

	# Compile all Components of the Astade Suite
	emake -C ${SOURCE_DIR}/AstadeAPI TARGET=AstadeAPI
	emake -C ${SOURCE_DIR}/Astade TARGET=Astade
	emake -C ${SOURCE_DIR}/CppGenerator TARGET=CppGenerator
	emake -C ${SOURCE_DIR}/OMDgenerator TARGET=OMDgenerator
	emake -C ${SOURCE_DIR}/ResourceEdit TARGET=ResourceEdit
	emake -C ${SOURCE_DIR}/StateChartCoder TARGET=StateChartCoder
	emake -C ${SOURCE_DIR}/StateChartDrawer TARGET=StateChartDrawer
	emake -C ${SOURCE_DIR}/UseCaseEdit TARGET=UseCaseEdit

}

src_install() {

	into ${INSTALL_DIR}
	dolib.a ${SOURCE_DIR}/AstadeAPI/libAstadeAPI.a
	dobin ${SOURCE_DIR}/Astade/Astade ${SOURCE_DIR}/CppGenerator/CppGenerator ${SOURCE_DIR}/OMDgenerator/OMDgenerator ${SOURCE_DIR}/ResourceEdit/ResourceEdit ${SOURCE_DIR}/StateChartCoder/StateChartCoder ${SOURCE_DIR}/StateChartDrawer/StateChartDrawer ${SOURCE_DIR}/UseCaseEdit/UseCaseEdit
	
	# Creating Symlinks to all Astade Components to ommit /opt/Astade/bin in users path
	dosym ${INSTALL_DIR}/bin/Astade /usr/bin/Astade
	dosym ${INSTALL_DIR}/bin/CppGenerator /usr/bin/CppGenerator
	dosym ${INSTALL_DIR}/bin/OMDgenerator /usr/bin/OMDgenerator
	dosym ${INSTALL_DIR}/bin/ResourceEdit /usr/bin/ResourceEdit
	dosym ${INSTALL_DIR}/bin/StateChartCoder /usr/bin/StateChartCoder
	dosym ${INSTALL_DIR}/bin/StateChartDrawer /usr/bin/StateChartDrawer
	dosym ${INSTALL_DIR}/bin/UseCaseEdit /usr/bin/UseCaseEdit

	# copying the Templates-Folder
	cp -r ${SOURCE_DIR}/Templates ${D}${INSTALL_DIR}
	chmod -R 0664 ${D}${INSTALL_DIR}/Templates

}
