# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4ec84b7df466555a4ec8119280dd02ff7d4b9e9c"

DESCRIPTION="cl-bodge resource player"
HOMEPAGE="https://github.com/borodust/bodge-player"
SRC_URI="https://github.com/borodust/bodge-player/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/log4cl
	dev-lisp/bordeaux-threads
	dev-lisp/cl-bodge
	dev-lisp/cl-fad
"
