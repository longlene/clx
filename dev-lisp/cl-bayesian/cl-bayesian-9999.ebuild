# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp routines for Bayesian estimation and analysis"
HOMEPAGE="https://github.com/tpapp/cl-bayesian"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tpapp/cl-bayesian.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/let-plus
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/cl-num-utils
	dev-lisp/lla
	dev-lisp/cl-random
	dev-lisp/lift
"
