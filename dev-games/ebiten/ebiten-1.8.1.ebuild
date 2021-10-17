# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/hajimehoshi/ebiten/..."

DESCRIPTION="A simple SNES-style 2D game library in Go"
HOMEPAGE="https://github.com/hajimehoshi/ebiten"
SRC_URI="https://github.com/hajimehoshi/ebiten/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-go/gl
	dev-go/glfw
	dev-go/go-openal
	dev-go/freetype
	dev-go/go-image
	dev-go/oto
	dev-go/go-mp3
	dev-go/oggvorbis
	dev-go/gopherwasm
	dev-go/gl-flock
"
RDEPEND="${DEPEND}"
