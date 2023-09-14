# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Rho is yet another array/dataframe package"
HOMEPAGE="https://github.com/blindglobe/rho"
SRC_URI=""

HOMEPAGE="https://github.com/blindglobe/rho.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clunit
	dev-lisp/fare-csv
"
