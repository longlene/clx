# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

MY_P=cl-ppcre-${PV}

DESCRIPTION="CL-PPCRE is a portable regular expression library for Common Lisp."
HOMEPAGE="http://weitz.de/cl-ppcre/
		  http://www.cliki.net/cl-ppcre"
SRC_URI="https://github.com/edicl/cl-ppcre/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="test"

RDEPEND="=dev-lisp/cl-ppcre-${PV}*[test?]
		dev-lisp/cl-unicode"

S="${WORKDIR}"/${MY_P}

src_prepare() {
	eapply_user
	rm -r cl-ppcre.asd *.lisp
	find test -type f -not -name 'unicode*' -exec rm -r {} \;
	if ! use test ; then
		sed -i '/defsystem\ :cl-ppcre-unicode-test/,$d' ${PN}.asd
		rm -r test
	fi
}
