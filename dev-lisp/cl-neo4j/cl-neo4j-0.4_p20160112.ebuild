# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bcaa7d147d5d703ea298298d767c31fe5c2ff6bb"

DESCRIPTION="interface to neo4j for Common Lisp"
HOMEPAGE="https://github.com/kraison/cl-neo4j"
SRC_URI="https://github.com/kraison/cl-neo4j/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/split-sequence
	dev-lisp/drakma
	dev-lisp/babel
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/fiveam
"
