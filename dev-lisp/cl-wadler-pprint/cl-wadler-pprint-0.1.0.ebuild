# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A Prettier Printer in Common Lisp"
HOMEPAGE="https://github.com/remexre/cl-wadler-pprint"
SRC_URI="https://github.com/remexre/cl-wadler-pprint/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:cl-wadler-pprint\/test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
