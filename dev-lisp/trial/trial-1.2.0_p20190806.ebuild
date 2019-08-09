# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="318c9167f2e0b263ff94b44d7fef4ff1ce7c5834"

DESCRIPTION="Yet another Common Lisp game engine"
HOMEPAGE="https://github.com/Shirakumo/trial"
SRC_URI="https://github.com/Shirakumo/trial/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
"
