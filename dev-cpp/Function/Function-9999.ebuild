# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Heap allocation free version of C++11 std::function"
HOMEPAGE="https://github.com/rigtorp/Function"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rigtorp/Function.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins Function.h
	dodoc README.md
}
