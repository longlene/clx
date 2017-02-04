# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="229dbd4a616ea6f85bf29d2421788989b8cddc6e"

DESCRIPTION="Turn-based tactical role-playing game"
HOMEPAGE="https://github.com/borodust/merci"
SRC_URI="https://github.com/borodust/merci/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/log4cl
	dev-lisp/cl-muth
	dev-lisp/bodge-blobs
	dev-lisp/cl-bodge
	dev-lisp/cl-fad
"
