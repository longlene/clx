# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="JavaScript Regular expressions make easy"
HOMEPAGE="https://github.com/VerbalExpressions/JSVerbalExpressions"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

NPM_EXTRA_FILES=VerbalExpressions.js
