# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f094454704a4ff6bebc39572a678169f2ad242d7"

DESCRIPTION="Bodacious Game Engine"
HOMEPAGE="https://github.com/borodust/cl-bodge"
SRC_URI="https://github.com/borodust/cl-bodge/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/uiop
	dev-lisp/log4cl
	dev-lisp/local-time
	dev-lisp/dissect
	dev-lisp/split-sequence
	dev-lisp/cl-autowrap
	dev-lisp/cl-muth
	dev-lisp/rtg-math
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-garbage
	dev-lisp/cffi
	dev-lisp/cl-flow
	dev-lisp/cl-glfw
	dev-lisp/trivial-main-thread
	dev-lisp/cl-opengl
	dev-lisp/cl-openal
	dev-lisp/cl-alc
	dev-lisp/opticl
	dev-lisp/cl-fad
	dev-lisp/fiveam
"
