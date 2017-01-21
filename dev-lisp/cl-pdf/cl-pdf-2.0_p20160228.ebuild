# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGIT_COMMIT="efb6a995916b51ef74b496a03c2857b91b908900"

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
