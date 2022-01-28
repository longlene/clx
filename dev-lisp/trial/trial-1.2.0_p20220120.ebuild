# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f2044d4b1ff7e1e4cc6a93edf2757b083c6af1a"

DESCRIPTION="Yet another Common Lisp game engine"
HOMEPAGE="https://github.com/Shirakumo/trial"
SRC_URI="https://github.com/Shirakumo/trial/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/3d-vectors
	dev-lisp/3d-matrices
	dev-lisp/verbose
	dev-lisp/deploy
	dev-lisp/cl-opengl
	dev-lisp/closer-mop
	dev-lisp/trivial-garbage
	dev-lisp/trivial-indent
	dev-lisp/bordeaux-threads
	dev-lisp/cl-opengl
	dev-lisp/cl-gamepad
	dev-lisp/cl-ppcre
	dev-lisp/pathname-utils
	dev-lisp/flare
	dev-lisp/for
	dev-lisp/flow
	dev-lisp/glsl-toolkit
	dev-lisp/fast-io
	dev-lisp/ieee-floats
	dev-lisp/float-features
	dev-lisp/lquery
	dev-lisp/static-vectors
	dev-lisp/pngload
	dev-lisp/cl-tga
	dev-lisp/cl-jepg
	dev-lisp/retrospectiff
	dev-lisp/terrable
	dev-lisp/mmap
	dev-lisp/messagebox
	dev-lisp/form-fiddle
	dev-lisp/lambda-fiddle
	dev-lisp/jsown
	dev-lisp/zpng
"
