# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b99d9c4ab013d081709538e63efc96642ceb1fa7"

DESCRIPTION="Common Lisp interface to gnuplot"
HOMEPAGE="https://github.com/martinkersner/cl-plot"
SRC_URI="https://github.com/martinkersner/cl-plot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-visualization/gnuplot
"
