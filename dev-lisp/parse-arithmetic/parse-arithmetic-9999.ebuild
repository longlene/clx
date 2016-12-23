# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Library for parsing and using user-provided infix arithmetic expressions"
HOMEPAGE="https://github.com/soemraws/parse-arithmetic"
SRC_URI=""

EGIT_REPO_URI="https://github.com/soemraws/parse-arithmetic.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/parse-float
"
