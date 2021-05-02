# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit base

DESCRIPTION="A program for creating and manipulating .far files for games Cytadela"
HOMEPAGE="http://cytadela.sf.net/"
SRC_URI="mirror://sourceforge/cytadela/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/FarEditor

DOCS=( "AUTHORS" "ChangeLog" "NEWS" "README" "TODO" )
