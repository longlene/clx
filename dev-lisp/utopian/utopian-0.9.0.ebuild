# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A web framework for Common Lisp never finished"
HOMEPAGE="https://github.com/fukamachi/utopian"
SRC_URI="https://github.com/fukamachi/utopian/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lack
	dev-lisp/mito
	dev-lisp/bordeaux-threads
	dev-lisp/caveman2
	dev-lisp/ningle
	dev-lisp/myway
	dev-lisp/cl-annot
	dev-lisp/djula
	dev-lisp/cl-ppcre
	dev-lisp/cl-dbi
	dev-lisp/lake
	dev-lisp/clack
	dev-lisp/jonathan
"
BDEPEND=""
