# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="CL-PPCRE is a portable regular expression library for Common Lisp."
HOMEPAGE="http://weitz.de/cl-ppcre/
		  http://www.cliki.net/cl-ppcre"
SRC_URI="https://github.com/edicl/cl-ppcre/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="test"

RDEPEND="test? ( dev-lisp/flexi-streams )"
PDEPEND="dev-lisp/cl-ppcre-unicode"

src_prepare() {
	eapply_user
	rm -r cl-ppcre-unicode test/unicode* cl-ppcre-unicode.asd
	if ! use test ; then
		sed -i '/defsystem\ :cl-ppcre-test/,$d' ${PN}.asd
		rm -r test
	fi
}

