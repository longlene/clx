# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common City"
HOMEPAGE="https://github.com/jsmpereira/common-city"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jsmpereira/common-city.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lispbuilder-sdl
	dev-lisp/lispbuilder-sdl-image
	dev-lisp/lispbuilder-sdl-mixer
	dev-lisp/lispbuilder-sdl-ttf
	dev-lisp/closer-mop
"
