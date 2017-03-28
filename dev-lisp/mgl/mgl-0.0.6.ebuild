# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="Common Lisp machine learning library"
HOMEPAGE="https://github.com/melisgl/mgl"
SRC_URI="https://github.com/melisgl/mgl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/closer-mop
dev-lisp/array-operation
dev-lisp/lla
dev-lisp/cl-reexport
dev-lisp/mgl-mat
dev-lisp/mgl-pax
dev-lisp/named-readtables
dev-lisp/pythonic-string-reader
"
