# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="SDL2 backend for ulubis"
HOMEPAGE="https://github.com/malcolmstill/ulubis-sdl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/malcolmstill/ulubis-sdl.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cepl_sdl2
	dev-lisp/ulubis
"
