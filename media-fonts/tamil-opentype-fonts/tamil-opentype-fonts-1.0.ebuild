# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A collection of GPLed opentype fonts for Tamil"
HOMEPAGE="http://sourceforge.net/projects/tamillinux/"
SRC_URI="mirror://sourceforge/tamillinux/${PN//-/_}-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN//-/_}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

DOCS="README"
