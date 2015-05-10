# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="C++11 header-only HTTP sever library"
HOMEPAGE="https://github.com/yhirose/cpp-httplib"
SRC_URI=""

EGIT_REPO_URI="https://github.com/yhirose/cpp-httplib.git"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins httplib.h
	dodoc README.md
}
