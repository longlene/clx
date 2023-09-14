# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="CLTL2 Environment Access Compatibility Layer"
HOMEPAGE="https://github.com/alex-gutev/cl-environments"
SRC_URI="https://github.com/alex-gutev/cl-environments/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/optima
	dev-lisp/collectors
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:cl-environments-test/,$d' ${PN}.asd
		rm -r test
	fi
}
