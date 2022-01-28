# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="258be4ac4daaceea06a55f893227584d3772bb47"

DESCRIPTION="Common Lisp Voxel Game Engine"
HOMEPAGE="https://github.com/gregcman/sucle"
SRC_URI="https://github.com/gregcman/sucle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/utility
	dev-lisp/bordeaux-threads
	dev-lisp/cl-opengl
	dev-lisp/cl-sqlite
	dev-lisp/base64
	dev-lisp/lparallel
	dev-lisp/alexandria
	dev-lisp/local-time
	dev-lisp/opticl
	dev-lisp/cffi
	dev-lisp/cl-ppcre
	dev-lisp/cl-reexport
	dev-lisp/sb-cga
	dev-lisp/split-sequence
	dev-lisp/glsl-toolkit
	dev-lisp/cl-cpus
	dev-lisp/cl-conspack
	dev-lisp/salza2
	dev-lisp/chipz
	dev-lisp/black-tie
	dev-lisp/structy-defclass
	dev-lisp/bodge-glfw
	dev-lisp/trivial-features
"
BDEPEND=""

src_prepare() {
	default
	rm -rf test
}
