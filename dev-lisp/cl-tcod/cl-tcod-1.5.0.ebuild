# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Common Lisp bindings for libtcod"
HOMEPAGE="https://bitbucket.org/eeeickythump/cl-tcod"
SRC_URI="https://bitbucket.org/eeeickythump/cl-tcod/get/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libtcod
	dev-lisp/cffi
	dev-lisp/cffi-libffi
	dev-lisp/defstar
"
