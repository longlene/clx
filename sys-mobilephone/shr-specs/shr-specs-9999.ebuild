# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit git-r3

DESCRIPTION=""
HOMEPAGE="http://www.shr-project.org"
EGIT_REPO_URI="http://git.shr-project.org/repo/shr-specs.git"
EGIT_PROJECT="shr-specs"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="
	dev-libs/libxslt"

src_compile() {
	make xml
}

src_install() {
	insinto /usr/share/shr/xml
	doins xml/*
}	
