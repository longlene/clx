# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5fc08b621c06"

DESCRIPTION="Common Lisp Autodoc generator"
HOMEPAGE="https://bitbucket.org/eeeickythump/clod"
SRC_URI="https://bitbucket.org/eeeickythump/clod/get/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/closer-mop
	dev-lisp/cl-ppcre
"
