# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dc935eb376a868017987a6944fcb2c10084db260"

DESCRIPTION="Lisp GUI for OpenGL canvas using Vecto, and Glop"
HOMEPAGE="https://github.com/johnfredcee/trivial-gui"
SRC_URI="https://github.com/johnfredcee/trivial-gui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/glop
	dev-lisp/cl-opengl
	dev-lisp/mathkit
	dev-lisp/opticl
	dev-lisp/cl-vectors
	dev-lisp/iterate
"
