# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5ab540c66c7c71a0ed2e06bbf1058d0f7dc3f585"

DESCRIPTION="Several graph algorithms in Common Lisp"
HOMEPAGE="https://github.com/fcbr/graph-algorithms"
SRC_URI="https://github.com/fcbr/graph-algorithms/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-speedy-queue
	dev-lisp/minheap
	dev-lisp/alexandria
"
