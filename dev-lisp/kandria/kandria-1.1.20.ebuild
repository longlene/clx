# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A detective game set in the post apocalypse"
HOMEPAGE="https://kandria.com/"
SRC_URI="https://github.com/Shirakumo/kandria/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/deploy
	dev-lisp/trial-glfw
	dev-lisp/trial-steam
	dev-lisp/trial-gog
	dev-lisp/trial-notify
	dev-lisp/alloy-constraint
	dev-lisp/depot
	dev-lisp/depot-zip
	dev-lisp/zip
	dev-lisp/fast-io
	dev-lisp/ieee-floats
	dev-lisp/babel
	dev-lisp/form-fiddle
	dev-lisp/array-utils
	dev-lisp/lambda-fiddle
	dev-lisp/trivial-arguments
	dev-lisp/filesystem-utils
	dev-lisp/trivial-indent
	dev-lisp/speechless
	dev-lisp/kandria-quest
	dev-lisp/alexandria
	dev-lisp/random-state
	dev-lisp/file-select
	dev-lisp/cl-mixed-wav
	dev-lisp/cl-mixed-vorbis
	dev-lisp/cl-modio
	dev-lisp/zpng
	dev-lisp/jzon
	dev-lisp/action-lisp
	dev-lisp/easing
	dev-lisp/promise
	dev-lisp/simple-tasks
	app-emacs/slime
"
BDEPEND=""
