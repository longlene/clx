# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit font

DESCRIPTION="Dhivehi (Maldivian) Thaana fonts"
HOMEPAGE="http://www.saturn.in/portfolio/${PN}.shtml"
SRC_URI="http://www.saturn.in/download/14/ -> ${PN}.zip"

LICENSE="as-is"
SLOT="0"
S="${WORKDIR}"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"

FONT_S="${WORKDIR}/fonts"
FONT_SUFFIX="ttf"
