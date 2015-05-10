# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="linenoise-based readline library"
HOMEPAGE="https://github.com/yhirose/cpp-linenoise"
SRC_URI=""

EGIT_REPO_URI="https://github.com/yhirose/cpp-linenoise.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins linenoise.hpp
	dodoc README.md
}
