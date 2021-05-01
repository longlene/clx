# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="Luke Tierney's Xlispstat statistical environmnet"
HOMEPAGE="https://github.com/jhbadger/xlispstat"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jhbadger/xlispstat.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_configure() {
	econf --prefix="${D}"/usr
}

src_compile() {
	emake -j1
}
