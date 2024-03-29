# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Data Frames for Common Lisp"
HOMEPAGE="https://github.com/sirherrbatka/vellum"
SRC_URI="https://github.com/sirherrbatka/vellum/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/serapeum
	dev-lisp/lparallel
	dev-lisp/closer-mop
	dev-lisp/metabang-bind
	dev-lisp/alexandria
	>=dev-lisp/cl-data-structures-1.4.0
	dev-lisp/documentation-utils-extensions
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd run-tests.lisp
}
