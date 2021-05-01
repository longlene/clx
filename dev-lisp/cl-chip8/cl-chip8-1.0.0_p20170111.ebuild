# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7d540f6d6a29e5961977204edc5d6e574cedb592"

DESCRIPTION="chip-8 emulator in common lisp"
HOMEPAGE="https://github.com/sjl/cl-chip8"
SRC_URI="https://github.com/sjl/cl-chip8/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cl-arrows
	dev-lisp/cl-opengl
	dev-lisp/cl-portaudio
	dev-lisp/iterate
	dev-lisp/cl-losh
	dev-lisp/qtools
"
