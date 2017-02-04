# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b220bbe3a87dd409e8e62cbd6cc204b6db7ed014"

DESCRIPTION="Data-flow concurrency library for Common Lisp"
HOMEPAGE="https://github.com/borodust/cl-flow"
SRC_URI="https://github.com/borodust/cl-flow/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
"
