# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Matches strings against configurable strings, globs, regular expressions, and/or functions"
HOMEPAGE="https://github.com/es128/anymatch"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/micromatch
dev-nodejs/arrify
"
