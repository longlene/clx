# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Self-contained C/C++ profiler library for Linux"
HOMEPAGE="https://github.com/cyrus-and/prof"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/cyrus-and/prof.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins prof.h
	dodoc README.md
}
