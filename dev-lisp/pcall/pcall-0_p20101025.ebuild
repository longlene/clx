# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0b4b98a45863b0f4437a8592c5630faa2d6437c5"

DESCRIPTION="A Common Lisp parallelization library"
HOMEPAGE="http://marijnhaverbeke.nl/pcall"
SRC_URI="https://github.com/marijnh/pcall/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/fiveam
"
