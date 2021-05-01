# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="CL-FAD is a thin portability layer atop the Common Lisp standard pathname functions."
HOMEPAGE="http://weitz.de/cl-fad/"
SRC_URI="https://github.com/edicl/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="test"

DEPENDS=""
RDEPENDS="${DEPENDS}
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/asdf:defsystem\ #:cl-fad-test/,$d' ${PN}.asd
		rm -r *.test.lisp
	fi
}

