# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit common-lisp-3

DESCRIPTION="A Common Lisp I/O library."
HOMEPAGE="http://common-lisp.net/project/iolib/"
SRC_URI="http://common-lisp.net/project/iolib/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=">dev-lisp/asdf-2.31.1
dev-lisp/alexandria
dev-lisp/cl-ppcre
>=dev-lisp/cffi-0.10.6
dev-lisp/trivial-features
dev-lisp/fiveam
dev-lisp/trivial-garbage
dev-lisp/bordeaux-threads
dev-lisp/babel
dev-lisp/idna"

CLSYSTEMS="iolib"
#CLSYSTEMS="src/iolib src/iolib.base src/iolib.multiplex \
	#		src/iolib.os src/iolib.pathnames.asd src/iolib.sockets \
	#		src/iolib.streams.asd src/iolib.syscalls.asd src/iolib.trivial-sockets.asd \
	#		examples/iolib.examples.asd tests/iolib-tests.asd"

src_install() {
	common-lisp-install-sources src examples *.asd
	common-lisp-install-sources -t all version.lisp-expr tests
	common-lisp-install-asdf
	dodoc CHANGES README
}
