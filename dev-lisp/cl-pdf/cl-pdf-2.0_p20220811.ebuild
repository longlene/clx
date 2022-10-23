# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1974f34baba99febb384ff121714f2fe370a8f9b"

DESCRIPTION="Common Lisp PDF Generation Library"
HOMEPAGE="https://github.com/mbattyani/cl-pdf"
SRC_URI="https://github.com/mbattyani/cl-pdf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	|| ( dev-lisp/salza dev-lisp/salza2 )
	dev-lisp/zpb-ttf
"
