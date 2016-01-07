# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="C++ regular expressions made easy"
HOMEPAGE="https://github.com/VerbalExpressions/CppVerbalExpressions"
SRC_URI=""

EGIT_REPO_URI="https://github.com/VerbalExpressions/CppVerbalExpressions.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins verbalexpressions.hpp
}
