# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

DESCRIPTION="Common Lisp library that allows to run a child process and have its input, output and error avaliable as Gray streams."
HOMEPAGE="https://github.com/archimag/cl-popen"
SRC_URI="http://archimag-lisp-overlay.googlecode.com/files/${P}.tar.bz2"

LICENSE="Lisp LGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/iolib dev-lisp/lift"

CLSYSTEMS="${PN}"

src_install() {
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf
}
