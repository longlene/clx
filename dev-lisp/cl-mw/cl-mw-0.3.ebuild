# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A Master/Slave Distributed Computing Library"
HOMEPAGE="http://pages.cs.wisc.edu/~psilord/lisp-public/cl-mw.html"
SRC_URI="http://pages.cs.wisc.edu/~psilord/lisp-public/releases/cl-mw/0.3/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hu_dwim_serializer
	dev-lisp/alexandria
	dev-lisp/iolib
	dev-lisp/cffi
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	use example || rm -r ${PN}.examples* examples
}
