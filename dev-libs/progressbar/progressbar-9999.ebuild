# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="An easy-to-use C library for displaying text progress bars"
HOMEPAGE="https://github.com/doches/progressbar"
SRC_URI=""

EGIT_REPO_URI="https://github.com/doches/progressbar.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake libprogressbar.so
	use static-libs && emake libprogressbar.a
}

src_install() {
	insinto /usr/include
	doins include/*.h
	dolib.so libprogressbar.so
	use static-libs && dolib.a libprogress.a
	dodoc README.mdown
}
