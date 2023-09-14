# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="85263af1c49c02d7e7b30110f2f6cce710818aba"

DESCRIPTION="OpenCL bindings for Matlisp"
HOMEPAGE="https://github.com/matlisp/matlisp-opencl"
SRC_URI="https://github.com/matlisp/matlisp-opencl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/matlisp
	dev-lisp/fiveam
	dev-lisp/cl-autowrap
	dev-lisp/trivia
	dev-lisp/trivial-garbage
	app-eselect/eselect-opencl
"
