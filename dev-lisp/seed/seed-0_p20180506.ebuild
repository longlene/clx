# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="af2b2ca81c862556a82f30d6e69cb65b8c6cadf7"

DESCRIPTION="Interactive software environment based on Common Lisp"
HOMEPAGE="https://github.com/phantomics/seed"
SRC_URI="https://github.com/phantomics/seed/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jonathan
	dev-lisp/symbol-munger
	dev-lisp/hunchentoot
	dev-lisp/parenscript
	dev-lisp/fare-quasiquote
	dev-lisp/quickproject
	dev-lisp/drakma
	dev-lisp/uuid
	dev-lisp/parse-number
	dev-lisp/cl-ppcre
	dev-lisp/cl-utilities
	dev-lisp/prove
	dev-lisp/cl-who
	dev-lisp/lass
	dev-lisp/alexandria
"
