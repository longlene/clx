# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="wrapper library of iconv for C++"
HOMEPAGE="https://github.com/unnonouno/iconvpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/unnonouno/iconvpp.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="virtual/libiconv"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins iconv.hpp
	dodoc README.rst
}
