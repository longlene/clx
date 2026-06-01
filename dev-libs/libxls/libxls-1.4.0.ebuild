# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="A library which can read Excel (xls) files"
HOMEPAGE="http://libxls.sourceforge.net/"
SRC_URI="mirror://sourceforge/libxls/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
S="${WORKDIR}"/${PN}
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"
