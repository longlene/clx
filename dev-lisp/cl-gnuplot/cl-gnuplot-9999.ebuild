# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Plotting library for Common Lisp"
HOMEPAGE="https://github.com/mobius-eng/cl-gnuplot"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mobius-eng/cl-gnuplot.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
