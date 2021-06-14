# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d9d5ec0e1a75b983eb3d18e1ec6cec2ccb92c2b9"

DESCRIPTION="Data Structures and streaming algorithms for Common Lisp"
HOMEPAGE="https://github.com/sirherrbatka/cl-data-structures"
SRC_URI="https://github.com/sirherrbatka/cl-data-structures/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/documentation-utils-extensions
	dev-lisp/more-conditions
	dev-lisp/closer-mop
	dev-lisp/lparallel
	dev-lisp/flexichain
	dev-lisp/metabang-bind
	dev-lisp/bordeaux-threads
	dev-lisp/scribble
	dev-lisp/osicat
	dev-lisp/cl-ppcre
	dev-lisp/trivial-garbage
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd test
}
