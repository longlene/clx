# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="899e77fc5c8178579545d0d6578b0007bae713ba"

DESCRIPTION="A flexible and extensible video game engine"
HOMEPAGE="https://github.com/Shirakumo/trial"
SRC_URI="https://github.com/Shirakumo/trial/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-features
	dev-lisp/3d-math
	dev-lisp/alexandria
	dev-lisp/atomics
	dev-lisp/bordeaux-threads
	dev-lisp/cl-gamepad
	dev-lisp/cl-opengl
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/jzon
	dev-lisp/convex-covering
	dev-lisp/deploy
	dev-lisp/depot
	dev-lisp/documentation-utils
	dev-lisp/filesystem-utils
	dev-lisp/float-features
	dev-lisp/flow
	dev-lisp/for
	dev-lisp/form-fiddle
	dev-lisp/glsl-toolkit
	dev-lisp/ieee-floats
	dev-lisp/lambda-fiddle
	dev-lisp/language-codes
	dev-lisp/lquery
	dev-lisp/lru-cache
	dev-lisp/machine-state
	dev-lisp/manifolds
	dev-lisp/memory-regions
	dev-lisp/messagebox
	dev-lisp/nibbles
	dev-lisp/open-with
	dev-lisp/pathname-utils
	dev-lisp/precise-time
	dev-lisp/promise
	dev-lisp/quickhull
	dev-lisp/random-sampling
	dev-lisp/random-state
	dev-lisp/random-noise
	dev-lisp/sha3
	dev-lisp/simple-tasks
	dev-lisp/system-locale
	dev-lisp/text-draw
	dev-lisp/trivial-deprecate
	dev-lisp/trivial-extensible-sequences
	dev-lisp/trivial-garbage
	dev-lisp/trivial-indent
	dev-lisp/verbose
	dev-lisp/zpng
"
