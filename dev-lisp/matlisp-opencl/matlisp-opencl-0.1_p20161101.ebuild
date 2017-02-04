# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a313605c70eb5fadff792c063557d2c49ba0bc23"

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
