# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="78fd62b63c5bb4935a45f7f7ecc19309fcf00d2a"

DESCRIPTION="Some helper methods for using sdl2-image to load images to CEPL types"
HOMEPAGE="https://github.com/cbaggers/cepl.sdl2-image"
SRC_URI="https://github.com/cbaggers/cepl.sdl2-image/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl
	dev-lisp/cl-sdl2
	dev-lisp/cl-sdl2-image
"
