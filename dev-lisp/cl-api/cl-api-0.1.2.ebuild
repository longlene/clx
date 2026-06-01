# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="CL-API is an application that generates an API in HTML format, given a"
HOMEPAGE="http://common-lisp.net/project/cl-api/"
SRC_URI="http://common-lisp.net/project/cl-api/files/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="
	dev-lisp/closer-mop
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
"
