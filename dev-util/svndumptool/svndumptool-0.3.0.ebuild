# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit distutils

DESCRIPTION="a tool for processing Subversion dump files"
HOMEPAGE="http://queen.borg.ch/subversion/svndumptool/"
SRC_URI="http://queen.borg.ch/subversion/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/python-2.4.4
	>=dev-util/subversion-1.4.2"

RDEPEND="${DEPEND}"

DOCS="CHANGELOG.txt TODO.txt"

