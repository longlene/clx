# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5299ce9750193fb85cda84d7923bba7305e07cc8"

DESCRIPTION="a REPL implementation"
HOMEPAGE="https://github.com/sharplispers/prepl"
SRC_URI="https://github.com/sharplispers/prepl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/iterate
	dev-lisp/bordeaux-threads
	dev-lisp/conium
	dev-lisp/named-readtables
"
