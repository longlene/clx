# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/go-gl/glfw/..."
EGIT_COMMIT="eecd6608b5674c04450c6e27b207340a57d27348"

DESCRIPTION="Go bindings for GLFW"
HOMEPAGE="https://github.com/go-gl/glfw"
SRC_URI="https://github.com/go-gl/glfw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/glfw
"

src_prepare() {
	eapply_user
	rm -rf src/${EGO_PN%/*}/v3.{0,1}
}
