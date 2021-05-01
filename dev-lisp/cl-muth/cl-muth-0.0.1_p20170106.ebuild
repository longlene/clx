# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7031937e35cf6013121e536f23d6494393e31c10"

DESCRIPTION="Multithreading and concurrency utilities"
HOMEPAGE="https://github.com/borodust/cl-muth"
SRC_URI="https://github.com/borodust/cl-muth/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/log4cl
"
