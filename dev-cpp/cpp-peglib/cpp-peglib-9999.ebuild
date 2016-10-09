# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="C++ header-only PEG library"
HOMEPAGE="https://github.com/yhirose/cpp-peglib"
SRC_URI=""

EGIT_REPO_URI="https://github.com/yhirose/cpp-peglib.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins peglib.h
	dodoc README.md
}
