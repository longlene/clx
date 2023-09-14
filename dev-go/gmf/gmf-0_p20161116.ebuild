# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/3d0c/gmf"
EGIT_COMMIT="3a2234cf1bb0dbc12682d78befd9c268a93c28fe"

DESCRIPTION="Go Media Framework"
HOMEPAGE="https://github.com/3d0c/gmf"
SRC_URI="https://github.com/3d0c/gmf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-video/ffmpeg
"
RDEPEND="${DEPEND}"
