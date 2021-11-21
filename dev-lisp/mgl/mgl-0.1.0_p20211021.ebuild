# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1bd0b43cbc1d152cf69a1d854112026d56c9b0b2"

DESCRIPTION="Common Lisp machine learning library"
HOMEPAGE="https://github.com/melisgl/mgl"
SRC_URI="https://github.com/melisgl/mgl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/array-operations
	dev-lisp/lla
	dev-lisp/cl-reexport
	dev-lisp/mgl-gnuplot
	dev-lisp/mgl-mat[test]
	dev-lisp/mgl-pax
	dev-lisp/named-readtables
	dev-lisp/pythonic-string-reader
"

src_prepare() {
	default
	use example || rm -rf ${PN}-example.asd example
	if ! use test ; then
		sed -i '/defsystem #:mgl\/test/,$d' ${PN}.asd
		rm -r test
	fi
}
