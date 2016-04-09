# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="SuperCollider client for Common Lisp"
HOMEPAGE="https://github.com/byulparan/cl-collider"
SRC_URI=""

EGIT_REPO_URI="https://github.com/byulparan/cl-collider.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/chanl
	dev-lisp/flexi-streams
	dev-lisp/osc-ext
	dev-lisp/scheduler
	dev-lisp/simple-utils
	dev-lisp/usocket
	media-sound/supercollider
"
