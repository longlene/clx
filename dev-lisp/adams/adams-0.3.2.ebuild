# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="UNIX system administration in Common Lisp"
HOMEPAGE="https://github.com/cl-adams/adams"
SRC_URI="https://github.com/cl-adams/adams/archive/refs/tags/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/chronicity
	dev-lisp/cl-base64
	dev-lisp/cl-debug
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/ironclad
	dev-lisp/parse-number
	dev-lisp/re
	dev-lisp/str
	dev-lisp/trivial-utf8
"
BDEPEND=""
