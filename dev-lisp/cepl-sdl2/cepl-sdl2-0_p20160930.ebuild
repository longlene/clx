# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bdf7818d16312bf6958c640ea8396a3e9d43f57d"

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
