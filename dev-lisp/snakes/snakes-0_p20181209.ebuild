# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8c7eae579bb24539dbd584a81a1049f3d3ff8bf8"

DESCRIPTION="Python-like generators for Common Lisp"
HOMEPAGE="https://github.com/BnMcGn/snakes"
SRC_URI="https://github.com/BnMcGn/snakes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-cont
	dev-lisp/closer-mop
	dev-lisp/fiveam
	dev-lisp/iterate
	dev-lisp/cl-utilities
	dev-lisp/alexandria
"
