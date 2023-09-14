# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="Open multi-methods for C++11"
HOMEPAGE="http://www.yorel.be/mm/"
SRC_URI="https://github.com/jll63/yomm11/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/add_subdirectory/{/tests/d}' \
		-e '/add_subdirectory/{/examples/d}' \
		-i CMakeLists.txt
}
