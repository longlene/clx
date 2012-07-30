# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils subversion

DESCRIPTION="the fast media tag lib"
HOMEPAGE="http://mtag.berlios.de/"
SRC_URI=""
ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/mtag/trunk/mtag"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND="media-libs/taglib
	>=dev-db/sqlite-3.3.12"
DEPEND="dev-util/cmake
	doc? ( app-doc/doxygen )
	${RDEPEND}"

src_compile() {
	cmake "${S}" || die "compile failed!"
	emake  || die "compile failed!"
	if use doc; then
		doxygen "${S}" || die "compile failed!"
	fi
}

src_install() {
	dobin mtag
	dodoc README ChangeLog AUTHORS
	if use doc; then
		dohtml html/*
	fi
}
