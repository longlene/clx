# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/imkira/go-libav/..."
EGIT_COMMIT="d11e7b8582564abeb22088a4f88e85b4f0c9c2a1"

DESCRIPTION="Go language bindings for ffmpeg libraries"
HOMEPAGE="https://github.com/imkira/go-libav"
SRC_URI="https://github.com/imkira/go-libav/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-video/ffmpeg
"
RDEPEND="${DEPEND}"
