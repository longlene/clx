# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Allegro 5 game programming library bindings for Common Lisp"
HOMEPAGE="https://github.com/resttime/cl-liballegro"
SRC_URI=""

EGIT_REPO_URI="https://github.com/resttime/cl-liballegro.git"

LICENSE="Allegro"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	media-libs/allegro
"
