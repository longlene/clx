# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit font

MY_P="SophiaNubian"

DESCRIPTION="SIL Gentium Unicode font for Nubian languages which use the Coptic Unicode character set."
HOMEPAGE="http://scripts.sil.org/SophiaNubian"
SRC_URI="http://scripts.sil.org/cms/scripts/render_download.php?site_id=nrsi&format=file&media_id=SN1.0.zip&filename=SN1.0.zip -> SN1.0.zip"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="app-arch/unzip"
RDEPEND=""
# media-libs/silgraphite x11-plugins/pangographite

DOCS="FONTLOG OFL OFL-FAQ Readme"
FONT_SUFFIX="ttf"

S="${WORKDIR}/${MY_P}"
FONT_S="${S}"

src_install() {
	font_src_install
	use doc && dodoc *.txt
}
