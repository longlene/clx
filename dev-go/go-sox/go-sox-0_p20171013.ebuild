# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/krig/go-sox"
EGIT_COMMIT="2995aa087f0edbce66f25037af7ca6771a74da74"

DESCRIPTION="libsox bindings for go"
HOMEPAGE="https://github.com/krig/go-sox"
SRC_URI="https://github.com/krig/go-sox/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="media-sound/sox"
RDEPEND="${DEPEND}"
