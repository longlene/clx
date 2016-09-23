# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="C++ network library based on libgo"
HOMEPAGE="https://github.com/yyzybb537/libgonet"
SRC_URI=""

EGIT_REPO_URI="https://github.com/yyzybb537/libgonet.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[context]
"
RDEPEND="${DEPEND}"
