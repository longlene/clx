# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit flag-o-matic cmake-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/actor-framework/actor-framework/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "/TARGETS/ s:DESTINATION lib:DESTINATION $(get_libdir):" lib*/CMakeLists.txt
}

src_configure() {
	append-cxxflags -std=c++11 -Wextra -Wall -pedantic -pthread -fPIC
	cmake-utils_src_configure
}

