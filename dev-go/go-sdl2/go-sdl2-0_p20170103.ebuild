# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/veandco/go-sdl2/..."
EGIT_COMMIT="29d75db2591136c18034ee04a816f23f28b673d6"

DESCRIPTION="SDL2 binding for Go"
HOMEPAGE="https://github.com/veandco/go-sdl2"
SRC_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-libs/libsdl2
	media-libs/sdl2-gfx
	media-libs/sdl2-image
	media-libs/sdl2-mixer[midi]
	media-libs/sdl2-ttf
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	rm -rf src/${EGO_PN%/*}/{examples,testing}
}
