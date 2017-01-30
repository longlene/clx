# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gordonklaus/portaudio"
EGIT_COMMIT="2a038c93424fb36d026982db9fd365504a49f566"

DESCRIPTION="Go bindings for the PortAudio audio I/O library"
HOMEPAGE="https://github.com/gordonklaus/portaudio"
SRC_URI="https://github.com/gordonklaus/portaudio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-libs/portaudio
"
RDEPEND="${DEPEND}"
