# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="1520849708743283d291c393cba4c7219a60d7bc"

DESCRIPTION="C++ header-only PEG library"
HOMEPAGE="https://github.com/yhirose/cpp-peglib"
SRC_URI="https://github.com/yhirose/cpp-peglib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins peglib.h
	dobin ${BUILD_DIR}/lint/peglint
	dodoc README.md
}
