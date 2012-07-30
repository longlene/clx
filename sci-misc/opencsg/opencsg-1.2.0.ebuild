# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit qt4-r2

DESCRIPTION="The Constructive Solid Geometry rendering library"
HOMEPAGE="http://www.opencsg.org/"
SRC_URI="http://www.opencsg.org/OpenCSG-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-libs/glew"
RDEPEND="${DEPEND}"

S="${WORKDIR}/OpenCSG-${PV}"

src_unpack() {
	unpack ${A}

	#Use System glew
	rm -Rf ${S}/glew
}

src_prepare() {
	# We actually want to install somthing
	cat << EOF >> src/src.pro 
include.path=/usr/include 
include.files=../include/* 
target.path=/usr/lib 
INSTALLS += target include 
EOF
	
}

src_configure() {
	 eqmake4 "${S}"/src/src.pro
}
