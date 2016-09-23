# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Elegant code generation for high-performance computing"
HOMEPAGE="https://github.com/marcoheisig/Petalisp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/marcoheisig/Petalisp.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/optima
	dev-lisp/fare-memoization
	dev-lisp/trivial-garbage
"
