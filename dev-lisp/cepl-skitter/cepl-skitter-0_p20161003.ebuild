# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4e9da59340529b04ad1455ddbce5dac72e961546"

DESCRIPTION="Plumbing to use skitter.sdl2 with cepl"
HOMEPAGE="https://github.com/cbaggers/cepl.skitter"
SRC_URI="https://github.com/cbaggers/cepl.skitter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl-glop
	dev-lisp/cepl-sdl2
	dev-lisp/skitter
"
