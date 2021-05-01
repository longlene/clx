# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3

DESCRIPTION="A simple HTTP/1.0 server with support for GET and HEAD requests"
HOMEPAGE="https://github.com/eugeneia/httpd0"
SRC_URI="https://github.com/eugeneia/httpd0/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/q-thread-pool
	dev-lisp/trivial-utf8
	dev-lisp/cl-date-time-parser
	dev-lisp/maxpc
	dev-lisp/parcent-encoding
	dev-lisp/cl-fad
	dev-lisp/file-types
	dev-lisp/uiop
"
