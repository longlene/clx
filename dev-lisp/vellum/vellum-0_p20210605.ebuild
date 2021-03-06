# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a2ae0dc989e32ebae891eb4691b0b50a82d12786"

DESCRIPTION="Data Frames for Common Lisp"
HOMEPAGE="https://github.com/sirherrbatka/vellum"
SRC_URI="https://github.com/sirherrbatka/vellum/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/serapeum
	dev-lisp/lparallel
	dev-lisp/cl-data-structures
	dev-lisp/metabang-bind
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/documentation-utils-extensions
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd run-tests.lisp
}
