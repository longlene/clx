# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A Unicode font for medievalists"
HOMEPAGE="http://junicode.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"

FONT_SUFFIX="ttf"

DOCS="Junicode.pdf aelfric_job.pdf"
