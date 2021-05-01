# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="16ac191ffcce0c6b3ee2d3508d15835fd6f48204"

DESCRIPTION="Random variates for Common Lisp"
HOMEPAGE="https://github.com/tpapp/cl-random"
SRC_URI="https://github.com/tpapp/cl-random/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/array-operations
	dev-lisp/cl-num-utils
	dev-lisp/cl-rmath
	dev-lisp/cl-slice
	dev-lisp/gsll
	dev-lisp/let-plus
	dev-lisp/lla
"
