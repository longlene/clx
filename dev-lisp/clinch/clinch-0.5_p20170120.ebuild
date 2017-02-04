# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3fef76abda2b1c7041b13b5bede368c7782572c0"

DESCRIPTION="Common Lisp 3D/2D Graphics Engine for OpenGL"
HOMEPAGE="https://github.com/BradWBeer/CLinch"
SRC_URI="https://github.com/BradWBeer/CLinch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="
	dev-lisp/cl-opengl
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-channels
	dev-lisp/cl-sdl2
	dev-lisp/rtg-math

	dev-lisp/cffi
	dev-lisp/cl-pango
	dev-lisp/cl-cairo2
	dev-lisp/xmls
	dev-lisp/cl-freeimage
	dev-lisp/classimp
"
