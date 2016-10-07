# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Yet another Common Lisp game engine"
HOMEPAGE="https://github.com/Shirakumo/trial"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shirakumo/trial.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/3d-vectors
	dev-lisp/verbose
	dev-lisp/qtools
	dev-lisp/cl-opengl
	dev-lisp/closer-mop
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/wavefront-loader
	dev-lisp/cl-gamepad
	dev-lisp/cl-monitors
	dev-lisp/pathname-utils
	dev-lisp/flare
	dev-lisp/for
	dev-lisp/
"
