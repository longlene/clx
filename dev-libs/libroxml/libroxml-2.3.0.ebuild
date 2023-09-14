# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="very light C xml parser library"
HOMEPAGE="http://www.libroxml.net/"
SRC_URI="https://github.com/blunderer/libroxml/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "/install/ s:DESTINATION lib/:DESTINATION $(get_libdir)/:" CMakeLists.txt
}
