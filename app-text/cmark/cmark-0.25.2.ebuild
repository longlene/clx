# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="CommonMark parsing and rendering library and program in C"
HOMEPAGE="https://github.com/jgm/cmark"
SRC_URI="https://github.com/jgm/cmark/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use test CMARK_TESTS)
	)
	cmake-utils_src_configure
}
