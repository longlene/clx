# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Simple IMAP4rev1 client library"
HOMEPAGE="https://common-lisp.net/project/clonsigna/index.shtml"
SRC_URI="https://common-lisp.net/project/clonsigna/files/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iolib
	dev-lisp/cl-base64
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/alexandria
	dev-lisp/cl-plus-ssl
	dev-lisp/babel
"
BDEPEND=""
