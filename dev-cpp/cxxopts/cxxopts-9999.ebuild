# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Lightweight C++ command line option parser"
HOMEPAGE="https://github.com/jarro2783/cxxopts"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jarro2783/cxxopts.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins cxxopts.hpp
	dodoc README.md
}
