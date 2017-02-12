# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gen2brain/raylib-go/..."
EGIT_COMMIT="ac3cb63287068d486eabb3d30173edb107f951d1"

DESCRIPTION="Go bindings for raylib"
HOMEPAGE="https://github.com/gen2brain/raylib-go"
SRC_URI="https://github.com/gen2brain/raylib-go/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-libs/glfw
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	rm -rf src/${EGO_PN%/*}/examples
}
