# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aea9c728991a60f6bbeecbb39fc7a8de7731f437"

DESCRIPTION="A detective game set in the post apocalypse"
HOMEPAGE="https://kandria.com/"
SRC_URI="https://github.com/Shinmera/kandria/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/deploy
	dev-lisp/trial
	dev-lisp/alloy-constraint
	dev-lisp/zip
	dev-lisp/fast-io
	dev-lisp/ieee-floats
	dev-lisp/babel
	dev-lisp/form-fiddle
	dev-lisp/array-utils
	dev-lisp/lambda-fiddle
	dev-lisp/trivial-arguments
	dev-lisp/trivial-indent
	dev-lisp/speechless
	dev-lisp/kandria-quest
	dev-lisp/alexandria
	dev-lisp/file-select
	dev-lisp/feedback-client
	dev-lisp/cl-mixed
	dev-lisp/zpng
	dev-lisp/jsown
	app-emacs/slime
"
BDEPEND=""
