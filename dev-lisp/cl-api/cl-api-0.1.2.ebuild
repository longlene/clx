# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-2

DESCRIPTION="CL-API is an application that generates an API in HTML format, given a package name and reading docstrings."
HOMEPAGE="http://common-lisp.net/project/cl-api/"
SRC_URI="http://common-lisp.net/project/cl-api/files/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/closer-mop
dev-lisp/alexandria
dev-lisp/cl-ppcre"

src_install() {
	common-lisp-install *.asd src/*.lisp
	common-lisp-symlink-asdf
}
