# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/myspell-lv/myspell-lv-20060316.ebuild,v 1.14 2009/06/22 13:40:32 jer Exp $

MYSPELL_SPELLING_DICTIONARIES=(
"lv,LV,lv_LV,Latvian (Latvia),lv_LV.zip"
)

MYSPELL_HYPHENATION_DICTIONARIES=(
"lv,LV,hyph_lv_LV,Latvian (Latvia),lv_LV.zip"
)

MYSPELL_THESAURUS_DICTIONARIES=(
)

inherit myspell

DESCRIPTION="Latvian dictionaries for myspell/hunspell"
LICENSE="LGPL-2.1"
HOMEPAGE="http://dict.dv.lv/home.php?prj=lv"
SRC_URI="http://dict.dv.lv/download/lv_LV-${PV}.zip"

KEYWORDS="~amd64"

