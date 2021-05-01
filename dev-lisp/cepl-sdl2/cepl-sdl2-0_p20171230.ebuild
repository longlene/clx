# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c22c86e6bbc71eabf512379db1a26b5aa236a558"

DESCRIPTION="SDL2 host for cepl"
HOMEPAGE="https://github.com/cbaggers/cepl.sdl2"
SRC_URI="https://github.com/cbaggers/cepl.sdl2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cepl
	dev-lisp/cl-sdl2
"
