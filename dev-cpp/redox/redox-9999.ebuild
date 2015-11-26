# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Modern, asynchronous, and wicked fast C++11 client for Redis"
HOMEPAGE="https://github.com/hmartiro/redox"
SRC_URI=""

EGIT_REPO_URI="https://github.com/hmartiro/redox.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	dev-libs/hiredis
	dev-libs/libev
"
RDEPEND="${DEPEND}"
