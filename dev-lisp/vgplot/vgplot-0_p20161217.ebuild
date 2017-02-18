# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5c55c5599e2cdf151bb619c4b1b2d12c4fb02ea7"

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
