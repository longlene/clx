# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6b1d1cb517155876ee77babffb75e520ff21ebf7"

DESCRIPTION="HTML5 parser for Common Lisp"
HOMEPAGE="https://github.com/copyleft/cl-html5-parser"
SRC_URI="https://github.com/copyleft/cl-html5-parser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="
	dev-lisp/cl-ppcre
	dev-lisp/flexi-streams
	dev-lisp/string-case
	dev-lisp/stefil
	dev-lisp/cl-json
	dev-lisp/split-sequence
	dev-lisp/cxml
"
