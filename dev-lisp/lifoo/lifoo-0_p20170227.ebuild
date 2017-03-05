# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9105da624213582b4f4bbcec6f0bb209dd5d2404"

DESCRIPTION="a fresh take on Forth in the spirit of Common Lisp"
HOMEPAGE="https://github.com/codr4life/lifoo/"
SRC_URI="https://github.com/codr4life/lifoo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cl-ppcre
	dev-lisp/cl4l
"
