# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ebf3df21bfc36e311d8a1526f656914217a3f677"

DESCRIPTION="music and visual experiments done in lisp"
HOMEPAGE="https://github.com/azimut/shiny"
SRC_URI="https://github.com/azimut/shiny/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-emacs/slime
	dev-lisp/cm
	dev-lisp/incudine
	dev-lisp/cl-ppcre
	dev-lisp/csound
	dev-lisp/screamer
	dev-lisp/cl-collider
	dev-lisp/cl-alsaseq
	dev-lisp/fluidsynth
	dev-lisp/arrows-macros
	dev-lisp/local-time
	dev-lisp/cepl
	dev-lisp/skitter
	dev-lisp/classimp
	dev-lisp/temporal-functions
	dev-lisp/dirt
	dev-lisp/split-sequence
	dev-lisp/rtg-math
	dev-lisp/dendrite
	dev-lisp/nineveh
	dev-lisp/with-setf
"
BDEPEND=""
