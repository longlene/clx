# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="76329928a3709387c0779175af56ec49d16bcd35"

DESCRIPTION="Common lisp library interfacing to the gnuplot utility"
HOMEPAGE="https://github.com/volkers/vgplot"
SRC_URI="https://github.com/volkers/vgplot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ltk
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
"
