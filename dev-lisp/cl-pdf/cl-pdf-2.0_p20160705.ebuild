# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dbafd62afcb2d2e9164054c72612763721297d59"

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
