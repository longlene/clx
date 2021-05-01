# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="The APL programming language compiling to Common Lisp"
HOMEPAGE="https://github.com/phantomics/april"
SRC_URI="https://github.com/phantomics/april/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/aplesque
	dev-lisp/vex
	dev-lisp/alexandria
	dev-lisp/array-operations
	dev-lisp/cl-ppcre
	dev-lisp/parse-number
	dev-lisp/symbol-munger
	dev-lisp/prove
"
