# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="421de1e4844a5142e37cb06805bc2d9d13ba048f"

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
