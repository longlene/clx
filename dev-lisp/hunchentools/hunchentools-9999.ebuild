# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Hunchentoot and CL-WHO utility library"
HOMEPAGE="https://github.com/michaeljforster/hunchentools/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/michaeljforster/hunchentools.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/ironclad
"
