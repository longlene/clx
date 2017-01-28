# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3cd784698b0a9abd32c901e6cbbe0352ef33fda3"

DESCRIPTION="List comprehensions and friends"
HOMEPAGE="https://github.com/TBRSS/cl-lc"
SRC_URI="https://github.com/TBRSS/cl-lc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/optima
	dev-lisp/iterate
"
