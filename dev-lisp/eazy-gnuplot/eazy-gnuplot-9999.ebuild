# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Super Duper Doopa Booka Lispy Gnuplot library"
HOMEPAGE="https://github.com/guicho271828/eazy-gnuplot/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/guicho271828/eazy-gnuplot.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/optima
dev-lisp/alexandria
dev-lisp/trivial-shell"

