# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit games vcs-snapshot

EGIT_COMMIT="b31971e4ad53d2658a2b58486d3c5593cddaaf38"

DESCRIPTION="Ambitious dungeon builder with roguelike elements"
HOMEPAGE="http://keeperrl.com"
SRC_URI="https://github.com/miki151/keeperrl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/libsdl2
	media-libs/libvorbis
	media-libs/openal
"
RDEPEND="${DEPEND}"

MY_DATA_DIR="${GAMES_DATADIR}"/${PN}

src_prepare() {
	eapply_user
	sed -e 's#-Wimplicit-fallthrough##' \
		-e 's#-Wno-mismatched-tags##' \
		-e 's#-Wno-tautological-constant-out-of-range-compare##' \
		-i Makefile
	#sed -i '/pragma once/d' stdafx.h
}

src_compile() {
	emake OPT=true RELEASE=true DATA_DIR=${MY_DATA_DIR}
}

src_install() {
	dobin keeper
	insinto ${MY_DATA_DIR}
	doins -r data{,_contrib,_free}
	dodoc README.md
}
