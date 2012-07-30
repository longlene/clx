# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Meta ebuild to pull in fonts for many languages"
HOMEPAGE="http://www.gentoo.org"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="
	media-fonts/dejavu

	media-fonts/arphicfonts
	media-fonts/baekmuk-fonts
	media-fonts/font-misc-meltho
	media-fonts/free-bangla-font
	media-fonts/ja-ipafonts
	media-fonts/khmer
	media-fonts/kochi-substitute
	media-fonts/lklug
	media-fonts/lohit-fonts
	media-fonts/manchu-font
	media-fonts/romancyrillicstd
	media-fonts/saweri
	media-fonts/sil-nubian
	media-fonts/sil-nuosu
	media-fonts/sil-padauk
	media-fonts/tagdoc
	media-fonts/thanaunicode
	media-fonts/tibetan-machine-font
	media-fonts/vulcanius
"

# arphicfonts		Chinese			zh
# baekmuk-fonts		Korean			ko
# font-misc-meltho	Aramaic			arc
# free-bangla-font	Bishnupriya Manipuri	bpy
# ja-ipafonts		Japanese Ainu		ain
# khmer			Khmer			km
# kochi-substitute	Japanese		ja
# lklug			Sinhala			si
# lohit-fonts		Indic			gu hi kn ml mr ne new sa ta te
# manchufont		Manchu			mnc
# romancyrillicstd	Old Slavonic		cu
# saweri		Buginese		bug
# sil-nubian		Coptic			cop
# sil-nuosu		Sichuan Yi, Nuosu	ii
# sil-padauk		Burmese			my
# tagdoc		Tagalog			tl
# thanaunicode		Divehi			dv
# tibetan-machine-font	Tibetan			bo
# vulcanius		Gothic			got
