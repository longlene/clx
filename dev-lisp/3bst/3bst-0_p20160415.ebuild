# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9599342887a7f15eb79ca5022fdc6fc738942ab7"

DESCRIPTION="CL port of the terminal emulation part of st"
HOMEPAGE="https://github.com/3b/3bst"
SRC_URI="https://github.com/3b/3bst/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
"
